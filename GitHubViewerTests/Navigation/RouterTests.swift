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
        let user = User(id: 1, login: "test", avatarURL: URL(string: "www.example.com")!, reposURL: URL(string: "www.example.com")!)

        let view = router.view(for: user) as? Text // TODO: Update view type

        #expect(view != nil)
    }
}
