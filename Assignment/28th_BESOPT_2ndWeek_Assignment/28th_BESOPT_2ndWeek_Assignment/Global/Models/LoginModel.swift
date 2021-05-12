//
//  LoginModel.swift
//  28th_BESOPT_2ndWeek_Assignment
//
//  Created by 노한솔 on 2021/05/12.
//

import Foundation

// MARK: - LoginModel
struct LoginModel: Codable {
    let success: Bool
    let message: String
    let data: Login
}

// MARK: - Login
struct Login: Codable {
    let userID: Int
    let userNickname, token: String

    enum CodingKeys: String, CodingKey {
        case userID = "UserId"
        case userNickname = "user_nickname"
        case token
    }
}
