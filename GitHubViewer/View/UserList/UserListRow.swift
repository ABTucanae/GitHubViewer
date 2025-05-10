//
//  UserListRow.swift
//  GitHubViewer
//
//  Created by Alex on 10/05/2025.
//

import SwiftUI

struct UserListRow: View {

    let user: String
    @EnvironmentObject var router: Router

    var body: some View {
        NavigationLink(destination: router.view(for: user)) {
            HStack(spacing: 16) {
                Image(systemName: "square.fill")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .clipShape(RoundedRectangle(cornerRadius: 8))

                Text(user)
                    .font(.title3)
            }
            .padding(.vertical, 4)
        }
    }
}

#Preview {
    NavigationView {
        List {
            UserListRow(user: "Example")
        }
    }
    .environmentObject(Router())
}
