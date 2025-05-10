//
//  UserListView.swift
//  GitHubViewer
//
//  Created by Alex on 09/05/2025.
//

import SwiftUI

struct UserListView: View {

    @State private var testData = ["A", "B", "C"]

    var body: some View {
        List(testData, id: \.self) { user in
            UserListRow(user: user)
        }
        .navigationTitle("Users")
    }
}

#Preview {
    NavigationView {
        UserListView()
    }
    .environmentObject(Router())
}
