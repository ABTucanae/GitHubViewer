//
//  RouterTests.swift
//  GitHubViewerTests
//
//  Created by Alex on 10/05/2025.
//

@testable import GitHubViewer
import Testing
import SwiftUI

@MainActor
struct RouterTests {

    private let router: Router

    init() {
        router = Router(viewModelFactory: ViewModelFactory(apiClient: ApiClientStub()))
    }

    @Test func testInitialView() {
        let view = router.initialView() as? UserListView

        #expect(view != nil)
    }

    @Test func testViewForUser() {
        let view = router.view(for: DummyUserService.testUser) as? UserDetailView

        #expect(view != nil)
    }

    @Test func testViewForRepo() {
        let view = router.view(for: DummyRepositoryService.testRepos[0]) as? RepositoryInfoView

        #expect(view != nil)
    }
}
