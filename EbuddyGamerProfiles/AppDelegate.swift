//
//  AppDelegate.swift
//  EbuddyGamerProfiles
//
//  Created by Indra on 20/12/24.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

final class FirebaseAppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        setupAnonymousAuthentication()
        setupMockData()
        return true
    }
}

extension FirebaseAppDelegate {
    func setupAnonymousAuthentication() {
        guard Auth.auth().currentUser == nil else  {
            let currentUser = Auth.auth().currentUser
            debugPrint("Anonymous User: \(currentUser?.isAnonymous ?? false), UID: \(currentUser?.uid ?? "")")
            return
        }
        Auth.auth().signInAnonymously { authResult, error in
            guard let user = authResult?.user,
                  error == nil else {
                return
            }
            let isAnonymous = user.isAnonymous
            let uid = user.uid
            debugPrint("Anonymous User: \(isAnonymous), UID: \(uid)")
        }
    }
}

extension FirebaseAppDelegate {
    func setupMockData() {
        let db = Firestore.firestore()
        let countQuery = db.collection(FirebaseConst.FirestoreDBCollection.users).count
        Task {
            do {
                let snapshot = try await countQuery.getAggregation(source: .server)
                guard snapshot.count == 0 else  {
                    debugPrint("Documents are not empty")
                    return
                }
                MockUserJSON.users.forEach { user in
                    let ref = db.collection(FirebaseConst.FirestoreDBCollection.users).document()
                    Task {
                        try await ref.setData([
                            "uid": ref.documentID,
                            "ge": 0,
                            "gender": user.gender?.rawValue ?? 0,
                            "email": user.email ?? "",
                            "phoneNumber": user.phoneNumber ?? "",
                        ])
                        debugPrint("Document added with ID: \(ref.documentID)")
                    }
                }
            } catch {
                debugPrint(error)
            }
        }
    }
}
