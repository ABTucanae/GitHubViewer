//
//  UserDetailViewModel.swift
//  GitHubViewer
//
//  Created by Alex on 11/05/2025.
//

import Foundation

@Observable class UserDetailViewModel {

    var presentError = false
    private let userService: UserServiceProtocol
    private let repositoryService: RepositoryServiceProtocol
    private(set) var user: User
    private(set) var repos = [Repository]()
    private(set) var isLoading = false
    private(set) var errorMessage = "" {
        didSet {
            presentError = true
        }
    }

    init(user: User, userService: UserServiceProtocol, repositoryService: RepositoryServiceProtocol) {
        self.user = user
        self.userService = userService
        self.repositoryService = repositoryService
    }

    func load() async {
        isLoading = true
        defer { isLoading = false }

        do {
            user = try await userService.fetchUser(id: user.login)
            repos = try await repositoryService.fetchUserRepos(from: user.reposURL).filter { !$0.fork }
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
