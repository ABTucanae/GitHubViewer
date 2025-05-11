//
//  User.swift
//  GitHubViewer
//
//  Created by Alex on 10/05/2025.
//

import Foundation

struct User: Decodable, Identifiable, Equatable {

    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarURL = "avatar_url"
        case reposURL = "repos_url"
    }

    let id: Int
    let login: String
    let avatarURL: URL
    let reposURL: URL
}
