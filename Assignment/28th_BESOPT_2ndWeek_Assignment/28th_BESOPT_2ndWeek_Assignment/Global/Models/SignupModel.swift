//
//  SignupModel.swift
//  28th_BESOPT_2ndWeek_Assignment
//
//  Created by 노한솔 on 2021/05/12.
//

import Foundation

// MARK: - SignupModel
struct SignupModel: Codable {
    let success: Bool
    let message: String
    let data: Signup
}

// MARK: - Signup
struct Signup: Codable {
    let nickname: String
}
