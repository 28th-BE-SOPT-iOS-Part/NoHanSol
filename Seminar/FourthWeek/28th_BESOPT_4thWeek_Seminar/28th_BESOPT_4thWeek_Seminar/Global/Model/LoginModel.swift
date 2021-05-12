//
//  LoginModel.swift
//  28th_BESOPT_4thWeek_Seminar
//
//  Created by 노한솔 on 2021/05/08.
//

import Foundation


// MARK: - Welcome
struct LoginModel: Codable {
    let success: Bool
    let message: String
    let data: Login
}

// MARK: - DataClass
struct Login: Codable {
    let userID: Int
    let userNickname, token: String

    enum CodingKeys: String, CodingKey {
        case userID = "UserId"
        case userNickname = "user_nickname"
        case token
    }
}
