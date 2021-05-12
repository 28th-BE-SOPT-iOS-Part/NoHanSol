
import Foundation

// MARK: - Welcome
struct SignupModel: Codable {
    let success: Bool
    let message: String
    let data: Signup
}

// MARK: - DataClass
struct Signup: Codable {
    let nickname: String
}
