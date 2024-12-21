//
//  EbuddyGamerProfilesApp.swift
//  EbuddyGamerProfiles
//
//  Created by Indra on 19/12/24.
//

import SwiftUI

@main
struct EbuddyGamerProfilesApp: App {
    @UIApplicationDelegateAdaptor(FirebaseAppDelegate.self) var firebaseAppDelegate

    var body: some Scene {
        WindowGroup {
            UserProfilesView()
        }
    }
}
