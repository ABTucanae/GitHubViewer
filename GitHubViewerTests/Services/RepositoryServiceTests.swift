//
//  RepositoryServiceTests.swift
//  GitHubViewerTests
//
//  Created by Alex on 12/05/2025.
//

import Foundation
@testable import GitHubViewer
import Testing

struct RepositoryServiceTests {

    private let service: RepositoryService
    private let apiClient: ApiClientStub

    init() {
        apiClient = ApiClientStub()
        service = RepositoryService(apiClient: apiClient)
    }

    @Test func testFetchUserReposReturnsListOfUsers() async throws {
        var endpointCalled = ""
        let expectedRepos = DummyRepositoryService.testRepos

        apiClient.requestHandler = { endpoint, _ in
            endpointCalled = endpoint
            return expectedRepos
        }

        let result = try await service.fetchUserRepos(from: "url")
        #expect(result == expectedRepos)
        #expect(endpointCalled == "url")
    }

    @Test func testFetchUserReposThrowsReturnedError() async {
        apiClient.requestHandler = { endpoint, _ in
            throw UnitTestError.randomError
        }

        do {
            let _ = try await service.fetchUserRepos(from: "url")
            #expect(Bool(false))
        } catch {
            #expect(error as? UnitTestError == .randomError)
        }
    }
}

