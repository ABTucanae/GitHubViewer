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
                    UserListRow(user: user)
                }
            }
        }
        .navigationTitle("Users")
        .alert(viewModel.errorMessage, isPresented: $viewModel.presentError, actions: {})
        .onAppear {
            Task {
                await viewModel.load()
            }
        }
    }
}
