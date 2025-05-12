//
//  UserService.swift
//  GitHubViewer
//
//  Created by Alex on 10/05/2025.
//

import Foundation

protocol UserServiceProtocol {

    func fetchUsers() async throws -> [User]
    func fetchUser(id: String) async throws -> User
}

class UserService: UserServiceProtocol {

    static let usersEndpoint = "\(Endpoints.base)\(Endpoints.users)"
    static let userEndpoint = "\(Endpoints.base)\(Endpoints.users)"

    private let apiClient: ApiClientProtocol

    init(apiClient: ApiClientProtocol) {
        self.apiClient = apiClient
    }

    func fetchUsers() async throws -> [User] {
        try await apiClient.makeRequest(endpoint: Self.usersEndpoint, method: .GET)
    }

    func fetchUser(id: String) async throws -> User {
        try await apiClient.makeRequest(endpoint: "\(Self.userEndpoint)/\(id)", method: .GET)
    }
}
