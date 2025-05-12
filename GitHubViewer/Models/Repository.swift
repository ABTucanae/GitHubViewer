//
//  Repository.swift
//  GitHubViewer
//
//  Created by Alex on 12/05/2025.
//

import Foundation

struct Repository: Decodable, Identifiable, Equatable {

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case fork
        case language
        case stargazersCount = "stargazers_count"
        case htmlURL = "html_url"
    }

    let id: Int
    let name: String
    let description: String?
    let fork: Bool
    let language: String?
    let stargazersCount: Int
    let htmlURL: URL
}
