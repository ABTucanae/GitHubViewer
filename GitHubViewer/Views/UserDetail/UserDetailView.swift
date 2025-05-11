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
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                UserInfoView(user: viewModel.user)

                Spacer()
            }
        }
        .onAppear(perform: loadUserInfo)
        .alert(viewModel.errorMessage, isPresented: $viewModel.presentError, actions: {})
    }

    private func loadUserInfo() {
        Task {
            await viewModel.load()
        }
    }
}

#Preview {
    UserDetailView(viewModel: UserDetailViewModel(user: DummyUserService.testUser, userService: DummyUserService()))
}
