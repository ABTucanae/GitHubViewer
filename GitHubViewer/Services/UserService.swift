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

    private let apiClient: ApiClientProtocol
    private let userEndpoint = "\(Endpoints.base)\(Endpoints.users)"

    init(apiClient: ApiClientProtocol) {
        self.apiClient = apiClient
    }

    func fetchUsers() async throws -> [User] {
        try await apiClient.makeRequest(endpoint: userEndpoint, method: .GET)
    }
}
