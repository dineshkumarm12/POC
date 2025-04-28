//
//  LandingView.swift
//  LOR_POC
//
//  Created by Dinesh Kumar.M on 18/04/25.
//  Copyright © 2025 LOR_POCOrganizationName. All rights reserved.
//
import SwiftUI

struct LandingView: View {
    @State private var refreshTrigger = false
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    UserView(refreshTrigger: $refreshTrigger)
                    PermissionListView(refreshTrigger: $refreshTrigger)
                }
                .padding()
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.gray.opacity(0.1))
            .toolbar {
                // Left side - Logout button
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // performLogout()
                    }) {
                        Text("Logout")
                            .foregroundColor(.red)
                    }
                    
                 // Center - Title
                 ToolbarItem(placement: .principal) {
                      Text("LOR Dashboard")
                          .font(.headline)
                          .foregroundColor(.primary)
                  }

                // Right side - Refresh button
                ToolbarItem(placement: .navigationBarTrailing) {
                      Button(action: {
                          refreshTrigger.toggle()
                      }) {
                          Image("Refresh") // Your custom refresh image
                              .resizable()
                              .frame(width: 24, height: 24)
                      }
                  }
              }
            }
        }
    }
}
