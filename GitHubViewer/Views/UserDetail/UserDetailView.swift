//
//  UserDetailView.swift
//  GitHubViewer
//
//  Created by Alex on 11/05/2025.
//

import SwiftUI

struct UserDetailView: View {

    @State var viewModel: UserDetailViewModel

    var body: some View {
        List {
            Section {
                UserInfoView(user: viewModel.user)
                    .listRowInsets(.init())
            }

            ForEach(viewModel.repos) { repo in
                UserRepoRowView(repo: repo)
            }
        }
        .onAppear(perform: loadUserInfo)
        .alert(viewModel.errorMessage, isPresented: $viewModel.presentError, actions: {})
        .loadingSpiner(isLoading: viewModel.isLoading)
    }

    private func loadUserInfo() {
        Task {
            await viewModel.load()
        }
    }
}

#Preview {
    UserDetailView(viewModel: UserDetailViewModel(user: DummyUserService.testUser,
                                                  userService: DummyUserService(),
                                                  repositoryService: DummyRepositoryService()))
}
