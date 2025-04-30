//
//  SceneDelegate.swift
//  LOR
//
//  Created by Dineshkumar on 24/04/25.
//
import SwiftUI

import SwiftUI
import SalesforceSDKCore
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
                        // Perform Logout
                        UserAccountManager.shared.logout()
                    }) {
                        Image(systemName: "arrow.backward.circle") 
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.black
                            )
                    }
                }
                
                // Center - Title
                ToolbarItem(placement: .principal) {
                    Text("LOR")
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

