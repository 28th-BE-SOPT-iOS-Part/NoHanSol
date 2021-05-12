//
//  LoginService.swift
//  28th_BESOPT_2ndWeek_Assignment
//
//  Created by 노한솔 on 2021/05/12.
//

import Alamofire
import Foundation

struct LoginService {
  static let shared = LoginService()
  
  private func makeParameters(email: String, password: String) -> Parameters {
    return ["email": email,
            "password": password]
  }
  
  func login(email: String,
             password: String,
             completion: @escaping (NetworkResult<Any>) -> Void) {
    let header: HTTPHeaders = ["Content-Type": "application/json"]
    let dataRequest = AF.request(APIConstants.loginURL,
                                 method: .post,
                                 parameters: makeParameters(email: email, password: password),
                                 encoding: JSONEncoding.default,
                                 headers: header)
    
    dataRequest.responseData { dataResponse in
      dump(dataResponse)
      switch dataResponse.result {
      case .success:
        guard let statusCode = dataResponse.response?.statusCode else {return}
        guard let value = dataResponse.value else {return}
        let networkResult = self.judgeStatus(by: statusCode, value)
        completion(networkResult)
      case .failure:
        completion(.pathErr)
      }
    }
  }
  
  private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
    let decoder = JSONDecoder()
    guard let decodedData = try? decoder.decode(LoginModel.self, from: data) else {return .pathErr}
    switch statusCode {
    case 200: return .success(decodedData.message, decodedData.data.token)
    case 400: return .requestErr(decodedData.message)
    case 500: return .serverErr
    default: return .networkFail
    }
  }
}

