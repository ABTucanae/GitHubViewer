//
//  RouterTests.swift
//  GitHubViewerTests
//
//  Created by Alex on 10/05/2025.
//

@testable import GitHubViewer
import Testing
import SwiftUI

struct RouterTests {

    @MainActor
    @Test func testViewForUser() async throws {
        let user = "Placeholder User" // TODO: Replace with a user struct

        let router = Router()
        let view = router.view(for: user) as? Text // TODO: Update view type

        #expect(view != nil)
    }
}
