//
//  Router.swift
//  GitHubViewer
//
//  Created by Alex on 10/05/2025.
//

import SwiftUI

@Observable
@MainActor
class Router {

    private let viewModelFactory: ViewModelBuildable

    init(viewModelFactory: ViewModelBuildable) {
        self.viewModelFactory = viewModelFactory
    }

    func initialView() -> some View {
        UserListView(viewModel: viewModelFactory.userListViewModel())
    }

    func view(for user: User) -> some View {
        UserDetailView(viewModel: viewModelFactory.userDetailViewModel(user: user))
    }

    func view(for repository: Repository) -> some View {
        RepositoryInfoView(repository: repository)
    }
}
