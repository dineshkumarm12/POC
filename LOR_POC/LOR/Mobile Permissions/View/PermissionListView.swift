//
//  SceneDelegate.swift
//  LOR
//
//  Created by Dineshkumar on 24/04/25.
//

import SwiftUI

struct PermissionListView: View {
    @StateObject private var viewModel = PermissionsVM()
    @Binding var refreshTrigger: Bool
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
            .onChange(of: refreshTrigger) { _ in
                    viewModel.fetchPermissions(forEmail: "dineshkumar.mylsami@wipro.com")
                }
        }
    }
}


#Preview {
    PermissionListView(refreshTrigger: .constant(true))
}


