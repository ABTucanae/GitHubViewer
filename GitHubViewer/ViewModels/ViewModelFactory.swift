//
//  ViewModelFactory.swift
//  GitHubViewer
//
//  Created by Alex on 10/05/2025.
//

import Foundation

protocol ViewModelBuildable {
    func userListViewModel() -> UserListViewModel
    func userDetailViewModel(user: User) -> UserDetailViewModel
}

class ViewModelFactory: ViewModelBuildable {

    private let apiClient: ApiClientProtocol

    init(apiClient: ApiClientProtocol) {
        self.apiClient = apiClient
    }

    func userListViewModel() -> UserListViewModel {
        let userService = UserService(apiClient: apiClient)
        return UserListViewModel(userService: userService)
    }

    func userDetailViewModel(user: User) -> UserDetailViewModel {
        let userService = UserService(apiClient: apiClient)
        let repositoryService = RepositoryService(apiClient: apiClient)
        return UserDetailViewModel(user: user, userService: userService, repositoryService: repositoryService)
    }
}
