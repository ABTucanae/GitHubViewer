//
//  AppModel.swift
//  GitHubViewer
//
//  Created by Alex on 10/05/2025.
//

import Foundation

@MainActor
class AppModel {
    let router: Router

    init() {
        let apiClient = Self.createApiClient()
        let viewModelFactory = ViewModelFactory(apiClient: apiClient)
        self.router = Router(viewModelFactory: viewModelFactory)
    }

    private static func createApiClient() -> ApiClientProtocol {
        let token = ApiTokenLoader.loadToken()
        let requestFactory = RequestFactory(accessToken: token)
        return ApiClient(requestFactory: requestFactory)
    }
}
