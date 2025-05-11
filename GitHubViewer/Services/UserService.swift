//
//  UserService.swift
//  GitHubViewer
//
//  Created by Alex on 10/05/2025.
//

import Foundation

protocol UserServicable {

    func fetchUsers() async throws -> [User]
}

class UserService: UserServicable {

    static let usersEndpoint = "\(Endpoints.base)\(Endpoints.users)"

    private let apiClient: ApiClientProtocol

    init(apiClient: ApiClientProtocol) {
        self.apiClient = apiClient
    }

    func fetchUsers() async throws -> [User] {
        try await apiClient.makeRequest(endpoint: Self.usersEndpoint, method: .GET)
    }
}
