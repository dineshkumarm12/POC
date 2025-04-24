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
                NavigationLink(destination: DetailView(title: item.name)) {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                            .frame(height: 50)

                    }
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


