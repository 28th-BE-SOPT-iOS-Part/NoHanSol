//
//  PersonDataModel.swift
//  28th_BESOPT_4thWeek_Seminar
//
//  Created by 노한솔 on 2021/05/08.
//

import Foundation

// MARK: - PersonDataMdoel
struct PersonDataModel: Codable {
  let status: Int
  let success: Bool
  let message: String
  let data: Person
}

// MARK: - Person
struct Person: Codable {
  let name, message: String
  
  enum CodingKeys: String, CodingKey {
    case name
    case message = "profile_message"
  }
}
