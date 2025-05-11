//
//  PreviewHelpers.swift
//  GitHubViewer
//
//  Created by Alex on 11/05/2025.
//

#if DEBUG
import Foundation
import SwiftUI

class DummyUserService: UserServicable {
    static let testUser = User(
        id: 1,
        login: "Username",
        avatarURL: URL(string: "https://avatars.githubusercontent.com/u/30735426?v=4")!,
        reposURL: URL(string: "https://example.com")!,
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
