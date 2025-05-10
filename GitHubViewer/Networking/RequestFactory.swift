//
//  RequestFactory.swift
//  GitHubViewer
//
//  Created by Alex on 10/05/2025.
//

import Foundation

struct RequestFactory {

    let accessToken: String

    func createAuthenticatedRequest(url: URL, method: HTTPMethod) -> URLRequest {
        var request = URLRequest(url: url)

        request.httpMethod = method.rawValue
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.addValue("application/vnd.github+json", forHTTPHeaderField: "Accept")
        request.addValue("2022-11-28", forHTTPHeaderField: "X-GitHub-Api-Version")

        return request
    }
}
