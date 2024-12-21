//
//  UserProfilesViewModel.swift
//  EbuddyGamerProfiles
//
//  Created by Indra on 20/12/24.
//

import Foundation
import FirebaseFirestore

final class UserProfilesViewModel: ObservableObject {
    @Published var profiles: [UserProfile] = []
    @Published var screenState: ScreenState = .initial

    func fetchProfiles() {
        screenState = .loading

        let db = Firestore.firestore()
        let usersCollection = db.collection(FirebaseConst.FirestoreDBCollection.users)
        usersCollection.getDocuments { [weak self] snapshot, error in
            guard let self else { return }
            if let error {
                debugPrint("Error fetching users: \(error)")
                self.screenState = .error(error: error)
                return
            }
            guard let snapshot else {
                debugPrint("No users found")
                self.screenState = .error(error: UserError.noUserFound)
                return
            }
            var profiles: [UserProfile] = []
            snapshot.documents.forEach { document in
                let userJSON = try? document.data(as: UserJSON.self)
                guard let userJSON else {
                    return
                }
                let userProfile = UserProfile(from: userJSON)
                profiles.append(userProfile)
            }
            guard !profiles.isEmpty else {
                self.screenState = .error(error: UserError.noUserFound)
                return
            }
            self.profiles = profiles
            self.screenState = .loaded
        }
    }
}
