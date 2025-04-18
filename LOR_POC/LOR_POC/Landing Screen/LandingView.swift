//
//  LandingView.swift
//  LOR_POC
//
//  Created by Dinesh Kumar.M on 18/04/25.
//  Copyright © 2025 LOR_POCOrganizationName. All rights reserved.
//
import SwiftUI

struct LandingView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    UserView()
                        .frame(height: 180
                )
                    PermissionListView()
                }
                .padding()
                
            }
            .navigationTitle("LOR Dashboard")
            .background(Color.gray.opacity(0.1))
        }
    }
}
