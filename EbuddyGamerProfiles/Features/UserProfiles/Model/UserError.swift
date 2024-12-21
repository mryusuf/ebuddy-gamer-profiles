//
//  UserError.swift
//  EbuddyGamerProfiles
//
//  Created by Indra on 21/12/24.
//

import Foundation

enum UserError: Error {
    case noUserFound
    
    var localizedDescription: String {
        switch self {
        case .noUserFound:
            return "No user found"
        }
    }
}
