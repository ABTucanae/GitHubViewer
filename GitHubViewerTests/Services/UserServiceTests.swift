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
        let expectedUsers = [DummyUserService.testUser]

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

    @Test func testFetchUserReturnsListOfUsers() async throws {
        var endpointCalled = ""
        let expectedUser = DummyUserService.testUser

        apiClient.requestHandler = { endpoint, _ in
            endpointCalled = endpoint
            return expectedUser
        }

        let result = try await service.fetchUser(id: "test")
        #expect(result == expectedUser)
        #expect(endpointCalled == "\(UserService.userEndpoint)/test")
    }

    @Test func testFetchUserThrowsReturnedError() async {
        apiClient.requestHandler = { endpoint, _ in
            throw UnitTestError.randomError
        }

        do {
            let _ = try await service.fetchUser(id: "")
            #expect(Bool(false))
        } catch {
            #expect(error as? UnitTestError == .randomError)
        }
    }
}
