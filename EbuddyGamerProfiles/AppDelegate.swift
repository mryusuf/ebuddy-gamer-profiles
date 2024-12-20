//
//  AppDelegate.swift
//  EbuddyGamerProfiles
//
//  Created by Indra on 20/12/24.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

final class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        let db = Firestore.firestore()
        Task {
            do {
                let ref = try await db.collection("USERS").addDocument(data: [
                    "first": "Ada",
                    "last": "Lovelace",
                    "born": 1815
                ])
                print("Document added with ID: \(ref.documentID)")
            } catch {
                print("Error adding document: \(error)")
            }
        }
        return true
    }
}
