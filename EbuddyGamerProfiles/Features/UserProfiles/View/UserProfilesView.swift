//
//  UserProfilesView.swift
//  EbuddyGamerProfiles
//
//  Created by Indra on 20/12/24.
//

import SwiftUI

struct UserProfilesView: View {
    @ObservedObject var viewModel: UserProfilesViewModel = .init()
    
    var body: some View {
        ZStack {
            switch viewModel.screenState {
            case .initial:
                Color.clear
            case .loading:
                ProgressView()
            case .loaded:
                Form {
                    ForEach(viewModel.profiles) { profile in
                        Section {
                            Text(profile.gender)
                            Text(profile.phoneNumber)
                            Text(profile.email)
                            Text(profile.id)
                        }
                    }
                }

            case .error(let error):
                Text(error.localizedDescription)
            }
        }        .onAppear {
            viewModel.fetchProfiles()
        }
    }
}

#Preview {
    UserProfilesView()
}
