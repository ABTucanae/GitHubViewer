//
//  UserListViewModel.swift
//  GitHubViewer
//
//  Created by Alex on 10/05/2025.
//

import Foundation

@Observable class UserListViewModel {

    var presentError = false
    private let userService: UserServiceProtocol
    private(set) var users = [User]()
    private(set) var isLoading = false
    private(set) var errorMessage = "" {
        didSet {
            presentError = true
        }
    }

    init(userService: UserServiceProtocol) {
        self.userService = userService
    }

    func load() async {
        isLoading = true
        defer { isLoading = false }

        do {
            users = try await userService.fetchUsers()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
