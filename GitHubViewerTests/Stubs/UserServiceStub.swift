//
//  UserServiceStub.swift
//  GitHubViewerTests
//
//  Created by Alex on 11/05/2025.
//

import Foundation
@testable import GitHubViewer

class UserServiceStub: UserServiceProtocol {

    var usersToReturn = [User]()
    var userToReturn: User?
    var errorToThrow: Error?

    private(set) var fetchUserId: String?

    func fetchUsers() async throws -> [User] {
        if let errorToThrow {
            throw errorToThrow
        }

        return usersToReturn
    }

    func fetchUser(id: String) async throws -> User {
        fetchUserId = id

        if let errorToThrow {
            throw errorToThrow
        } else if let userToReturn {
            return userToReturn
        }

        throw UnitTestError.incorrectSetup
    }
}
