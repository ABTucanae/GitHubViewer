//
//  PreviewHelpers.swift
//  GitHubViewer
//
//  Created by Alex on 11/05/2025.
//

#if DEBUG
import Foundation
import SwiftUI

class DummyUserService: UserServiceProtocol {

    static let testUser = User(
        id: 1,
        login: "Username",
        avatarURL: URL(string: "https://avatars.githubusercontent.com/u/30735426?v=4")!,
        reposURL: "https://example.com",
        name: "Some Name",
        followers: 100,
        following: 1000
    )

    func fetchUsers() async throws -> [User] {
        [Self.testUser, Self.testUser]
    }

    func fetchUser(id: String) async throws -> User {
        Self.testUser
    }
}

class DummyRepositoryService: RepositoryServiceProtocol {

    static let testRepos = [
        Repository(
            id: 1,
            name: "Hello World Fork",
            description: "Description goes here",
            fork: true, language: "Swift",
            stargazersCount: 10,
            htmlURL: URL(string: "https://example.com")!
        ),
        Repository(
            id: 1,
            name: "Hello World",
            description: "Description goes here",
            fork: false,
            language: "Swift",
            stargazersCount: 10,
            htmlURL: URL(string: "https://example.com")!
        ),
        Repository(
            id: 2,
            name: "Hello World 2",
            description: "Description goes here",
            fork: false,
            language: "Dart",
            stargazersCount: 100,
            htmlURL: URL(string: "https://example.com")!
        )
    ]

    func fetchUserRepos(from url: String) async throws -> [Repository] {
        Self.testRepos
    }
}

private class DummyApiClient: ApiClientProtocol {

    func makeRequest<T>(endpoint: String, method: HTTPMethod) async throws -> T where T: Decodable {
        throw NetworkError.invalidResponse
    }
}

@MainActor
func makePreviewRouter() -> Router {
    let factory = ViewModelFactory(apiClient: DummyApiClient())
    return Router(viewModelFactory: factory)
}

#endif
