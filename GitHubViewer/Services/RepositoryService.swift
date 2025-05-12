//
//  RepositoryService.swift
//  GitHubViewer
//
//  Created by Alex on 12/05/2025.
//

import Foundation

protocol RepositoryServiceProtocol {

    func fetchUserRepos(from url: String) async throws -> [Repository]
}

class RepositoryService: RepositoryServiceProtocol {

    private let apiClient: ApiClientProtocol

    init(apiClient: ApiClientProtocol) {
        self.apiClient = apiClient
    }

    func fetchUserRepos(from url: String) async throws -> [Repository] {
        try await apiClient.makeRequest(endpoint: url, method: .GET)
    }
}
