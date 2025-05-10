//
//  ApiTokenLoader.swift
//  GitHubViewer
//
//  Created by Alex on 10/05/2025.
//

import Foundation

enum ApiTokenLoader {
    static func loadToken() -> String {
        Bundle.main.infoDictionary?["API_TOKEN"] as? String ?? ""
    }
}
