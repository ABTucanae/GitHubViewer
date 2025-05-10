//
//  ViewModelFactory.swift
//  GitHubViewer
//
//  Created by Alex on 10/05/2025.
//

import Foundation

protocol ViewModelBuildable {
    func userListViewModel() -> UserListViewModel
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
}
