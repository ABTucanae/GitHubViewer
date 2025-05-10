//
//  GitHubViewerApp.swift
//  GitHubViewer
//
//  Created by Alex on 09/05/2025.
//

import SwiftUI

@main
struct GitHubViewerApp: App {

    private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                appModel.router.initialView()
            }
            .environment(appModel.router)
        }
    }
}
