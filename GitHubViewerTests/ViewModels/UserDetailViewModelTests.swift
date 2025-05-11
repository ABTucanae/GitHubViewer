//
//  UserDetailViewModelTests.swift
//  GitHubViewerTests
//
//  Created by Alex on 11/05/2025.
//

import Foundation
@testable import GitHubViewer
import Testing

struct UserDetailViewModelTests {
    
    private let viewModel: UserDetailViewModel
    private let service: UserServiceStub
    private let initialUser = User(id: 99, login: "start", avatarURL: URL(string: "example.com")!, reposURL: URL(string: "example.com")!, name: "initial state", followers: 1, following: 0)

    init() {
        service = UserServiceStub()
        viewModel = UserDetailViewModel(user: initialUser, userService: service)
    }

    @Test func testLoadSuccessUpdatesUser() async throws {
        let expectedUser = DummyUserService.testUser

        service.userToReturn = expectedUser

        await viewModel.load()

        #expect(viewModel.user == expectedUser)
        #expect(viewModel.isLoading == false)
        #expect(viewModel.presentError == false)
        #expect(viewModel.errorMessage == "")
        #expect(service.fetchUserId == initialUser.login)
    }

    @Test func testLoadErrorUpdatesErrorMessage() async throws {
        service.errorToThrow = UnitTestError.randomError

        await viewModel.load()

        #expect(viewModel.user == initialUser)
        #expect(viewModel.isLoading == false)
        #expect(viewModel.presentError == true)
        #expect(viewModel.errorMessage == "The operation couldn’t be completed. (GitHubViewerTests.UnitTestError error 1.)")
    }
}
