//
//  RequestFactoryTests.swift
//  GitHubViewerTests
//
//  Created by Alex on 10/05/2025.
//

import Foundation
@testable import GitHubViewer
import Testing

struct RequestFactoryTests {

    @Test func testInitStoresAccessToken() async throws {
        let accessToken = "ABC123"
        let factory = RequestFactory(accessToken: accessToken)

        #expect(factory.accessToken == accessToken)
    }

    @Test() func testCreateAuthenticatedRequest() {
        let accessToken = "098EWQ"
        let factory = RequestFactory(accessToken: accessToken)
        let url = URL(string: "\(Endpoints.base)/example")!

        let request = factory.createAuthenticatedRequest(url: url, method: .POST)

        #expect(request.httpMethod == "POST")
        #expect(request.url == url)
        #expect(request.value(forHTTPHeaderField: "Authorization") == "Bearer \(accessToken)")
        #expect(request.value(forHTTPHeaderField: "Accept") == "application/vnd.github+json")
        #expect(request.value(forHTTPHeaderField: "X-GitHub-Api-Version") == "2022-11-28")
    }
}
