//
//  UserProfile.swift
//  EbuddyGamerProfiles
//
//  Created by Indra on 21/12/24.
//

import Foundation

struct UserProfile: Codable, Identifiable {
    let id: String
    let email: String
    let phoneNumber: String
    let gender: String
    
    init(uid: String,
         email: String,
         phoneNumber: String,
         gender: String) {
        self.id = uid
        self.email = email
        self.phoneNumber = phoneNumber
        self.gender = gender
    }
    
    init(from userJson: UserJSON) {
        self.id = userJson.uid ?? ""
        self.email = userJson.email ?? ""
        self.phoneNumber = userJson.phoneNumber ?? ""
        self.gender = userJson.gender?.symbol ?? ""
    }
}
