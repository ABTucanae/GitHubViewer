//
//  UserListView.swift
//  GitHubViewer
//
//  Created by Alex on 09/05/2025.
//

import SwiftUI

struct UserListView: View {

    @State private var viewModel: UserListViewModel

    init(viewModel: UserListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                List(viewModel.users) { user in
                    UserListRowView(user: user)
                }
            }
        }
        .navigationTitle("Users")
        .alert(viewModel.errorMessage, isPresented: $viewModel.presentError, actions: {})
        .onAppear(perform: loadUsers)
    }

    private func loadUsers() {
        Task {
            await viewModel.load()
        }
    }
}

#Preview {
    NavigationView {
        UserListView(viewModel: UserListViewModel(userService: DummyUserService()))
            .environment(makePreviewRouter())
    }
}
