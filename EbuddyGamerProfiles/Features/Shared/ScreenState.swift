//
//  ScreenState.swift
//  EbuddyGamerProfiles
//
//  Created by Indra on 21/12/24.
//

import Foundation

enum ScreenState {
    case initial
    case loading
    case loaded
    case error(error: Error)
}
