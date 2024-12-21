//
//  UserJSON.swift
//  EbuddyGamerProfiles
//
//  Created by Indra on 20/12/24.
//

import Foundation

struct UserJSON: Codable {
    let ge: Int?
    let uid: String?
    let email: String?
    let phoneNumber: String?
    let gender: GenderEnum?
}

enum GenderEnum: Int, Codable {
    case female = 0
    case male = 1
    
    var symbol: String {
        switch self {
        case .female: return "♀"
        case .male: return "♂"
        }
    }
}
struct MockUserJSON {
    static let users: [UserJSON] = [
        UserJSON(ge: 0, uid: nil, email: "jane.doe@example.com", phoneNumber: "+6281234567890", gender: .female),
        UserJSON(ge: 0, uid: nil, email: "john.smith@example.com", phoneNumber: "+6598765432", gender: .male),
        UserJSON(ge: 0, uid: nil, email: "emily.brown@example.com", phoneNumber: "+6391122334455", gender: .female),
        UserJSON(ge: 0, uid: nil, email: "michael.jones@example.com", phoneNumber: "+66855667788", gender: .male),
        UserJSON(ge: 0, uid: nil, email: "daniel.wilson@example.com", phoneNumber: "+67366778899", gender: .male),
        UserJSON(ge: 0, uid: nil, email: "sophia.taylor@example.com", phoneNumber: "+65677889900", gender: .female),
        UserJSON(ge: 0, uid: nil, email: "liam.martin@example.com", phoneNumber: "+60199887766", gender: .male),
        UserJSON(ge: 0, uid: nil, email: "olivia.moore@example.com", phoneNumber: "+6399988776655", gender: .female),
        UserJSON(ge: 0, uid: nil, email: "noah.jackson@example.com", phoneNumber: "+6013344556677", gender: .male),
        UserJSON(ge: 0, uid: nil, email: "isabella.white@example.com", phoneNumber: "+66833445566", gender: .female)
    ]
}
