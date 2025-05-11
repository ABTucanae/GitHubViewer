//
//  UserDetailViewModel.swift
//  GitHubViewer
//
//  Created by Alex on 11/05/2025.
//

import Foundation

@Observable class UserDetailViewModel {

    var presentError = false
    private let userService: UserServicable
    private(set)var user: User
    private(set) var isLoading = false
    private(set) var errorMessage = "" {
        didSet {
            presentError = true
        }
    }

    init(user: User, userService: UserServicable) {
        self.user = user
        self.userService = userService
    }

    func load() async {
        isLoading = true
        defer { isLoading = false }

        do {
            user = try await userService.fetchUser(id: user.login)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
