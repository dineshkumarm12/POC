//
//  PermissionListView.swift
//  LOR_POC
//
//  Created by Dinesh Kumar.M on 18/04/25.
//  Copyright © 2025 LOR_POCOrganizationName. All rights reserved.
//

import SwiftUI

struct PermissionListView: View {
    @StateObject private var viewModel = PermissionsModel()

    var body: some View {
        NavigationView {
            List(viewModel.permissionAssignments) { item in
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    Text(item.user.email)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .onAppear {
                viewModel.fetchPermissions(forEmail: "dineshkumar.mylsami@wipro.com")
            }
        }
    }
}
#Preview {
    PermissionListView()
}
