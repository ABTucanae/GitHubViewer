//
//  UserServiceTests.swift
//  GitHubViewerTests
//
//  Created by Alex on 11/05/2025.
//

import Foundation
@testable import GitHubViewer
import Testing

struct UserServiceTests {

    private let service: UserService
    private let apiClient: ApiClientStub

    init() {
        apiClient = ApiClientStub()
        service = UserService(apiClient: apiClient)
    }

    @Test func testFetchUsersReturnsListOfUsers() async throws {
        var endpointCalled = ""
        let expectedUsers = [User(id: 1, login: "hello", avatarURL: URL(string: "www.example.com")!, reposURL: URL(string: "www.example.com")!)]

        apiClient.requestHandler = { endpoint, _ in
            endpointCalled = endpoint
            return expectedUsers
        }

        let result = try await service.fetchUsers()
        #expect(result == expectedUsers)
        #expect(endpointCalled == UserService.usersEndpoint)
    }

    @Test func testFetchUsersThrowsReturnedError() async {
        apiClient.requestHandler = { endpoint, _ in
            throw UnitTestError.randomError
        }

        do {
            let _ = try await service.fetchUsers()
            #expect(Bool(false))
        } catch {
            #expect(error as? UnitTestError == .randomError)
        }
    }
}
