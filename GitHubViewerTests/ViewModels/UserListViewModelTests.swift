//
//  UserListViewModelTests.swift
//  GitHubViewerTests
//
//  Created by Alex on 11/05/2025.
//

import Foundation
@testable import GitHubViewer
import Testing

struct UserListViewModelTests {

    private let viewModel: UserListViewModel
    private let service: UserServiceStub

    init() {
        service = UserServiceStub()
        viewModel = UserListViewModel(userService: service)
    }

    @Test func testLoadSuccessUpdatesUserList() async throws {
        let expectedUsers = [User(id: 1, login: "view model", avatarURL: URL(string: "www.example.com")!, reposURL: URL(string: "www.example.com")!)]

        service.usersToReturn = expectedUsers

        await viewModel.load()

        #expect(viewModel.users == expectedUsers)
        #expect(viewModel.isLoading == false)
        #expect(viewModel.presentError == false)
        #expect(viewModel.errorMessage == "")
    }

    @Test func testLoadErrorUpdatesErrorMessage() async throws {
        service.errorToThrow = UnitTestError.randomError

        await viewModel.load()

        #expect(viewModel.users == [])
        #expect(viewModel.isLoading == false)
        #expect(viewModel.presentError == true)
        #expect(viewModel.errorMessage == "The operation couldn’t be completed. (GitHubViewerTests.UnitTestError error 1.)")
    }
}
