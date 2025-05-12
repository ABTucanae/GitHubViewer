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
    private let userService: UserServiceStub
    private let repoService: RepositoryServiceStub
    private let initialUser = User(id: 99, login: "start", avatarURL: URL(string: "example.com")!, reposURL: "example.com", name: "initial state", followers: 1, following: 0)

    init() {
        userService = UserServiceStub()
        repoService = RepositoryServiceStub()
        viewModel = UserDetailViewModel(user: initialUser, userService: userService, repositoryService: repoService)
    }

    @Test func testLoadSuccessUpdatesUser() async throws {
        let expectedUser = DummyUserService.testUser
        let expectedRepos = DummyRepositoryService.testRepos.filter { !$0.fork }

        userService.userToReturn = expectedUser
        repoService.reposToReturn = DummyRepositoryService.testRepos

        await viewModel.load()

        #expect(viewModel.user == expectedUser)
        #expect(viewModel.repos == expectedRepos)
        #expect(viewModel.isLoading == false)
        #expect(viewModel.presentError == false)
        #expect(viewModel.errorMessage == "")
        #expect(userService.fetchUserId == initialUser.login)
    }

    @Test func testLoadUserServiceErrorUpdatesErrorMessage() async throws {
        userService.errorToThrow = UnitTestError.randomError

        await viewModel.load()

        #expect(viewModel.user == initialUser)
        #expect(viewModel.isLoading == false)
        #expect(viewModel.presentError == true)
        #expect(viewModel.errorMessage == "The operation couldn’t be completed. (GitHubViewerTests.UnitTestError error 1.)")
    }

    @Test func testLoadRepoServiceErrorUpdatesErrorMessage() async throws {
        let expectedUser = DummyUserService.testUser
        repoService.errorToThrow = UnitTestError.randomError
        userService.userToReturn = expectedUser

        await viewModel.load()

        #expect(viewModel.user == expectedUser)
        #expect(viewModel.repos.isEmpty == true)
        #expect(viewModel.isLoading == false)
        #expect(viewModel.presentError == true)
        #expect(viewModel.errorMessage == "The operation couldn’t be completed. (GitHubViewerTests.UnitTestError error 1.)")
    }
}
