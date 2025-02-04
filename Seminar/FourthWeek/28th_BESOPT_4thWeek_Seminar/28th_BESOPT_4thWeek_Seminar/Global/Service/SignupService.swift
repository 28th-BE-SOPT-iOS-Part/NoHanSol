//
//  SignupService.swift
//  28th_BESOPT_4thWeek_Seminar
//
//  Created by 노한솔 on 2021/05/08.
//


import Alamofire
import Foundation


struct SignupService {
  static let shared = SignupService()
  
  private func makeParameters(email: String, password: String) -> Parameters {
    return ["email": email,
            "password": password,
            "sex": "0",
            "nickname": "sopt_test",
            "phone": "010-0000-1234",
            "birth": "1995-01-01"]
  }
  
  func signup(email: String,
             password: String,
             completion: @escaping (NetworkResult<Any>) -> Void) {
    let header: HTTPHeaders = ["Content-Type": "application/json"]
    let dataRequest = AF.request(APIConstants.signupURL,
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
    guard let decodedData = try? decoder.decode(SignupModel.self, from: data) else {return .pathErr}
    switch statusCode {
    case 200: return .success(decodedData.message)
    case 400: return .requestErr(decodedData.message)
    case 500: return .serverErr
    default: return .networkFail
    }
  }
}

