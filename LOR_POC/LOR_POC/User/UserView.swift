//
//  UserView.swift
//  LOR_POC
//
//  Created by Dinesh Kumar.M on 15/04/25.
//  Copyright © 2025 LOR_POCOrganizationName. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import SalesforceSDKCore


struct UserView: View {
    @StateObject var viewModel = UserDetailsModel()
    @Binding var refreshTrigger: Bool
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                if let user = viewModel.userInfo {
                    HStack {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        VStack(alignment: .leading){
                            Text("\(user.displayName)").font(.headline)
                            Text("\(user.username)")
                                .font(.subheadline)
                        }
                    }
                    .background(Color.clear)

                } else {
                    ProgressView("Loading user...")
                }
            }
            .padding(.leading,0)
            .background(Color.clear)
            .onAppear {
                viewModel.fetchLoggedInUserInfo()
            }
            .onChange(of: refreshTrigger) { _ in
                    viewModel.fetchLoggedInUserInfo()
                }
            
        }
        .padding()
        .navigationTitle("LOR")
        .background(Color.clear)
        .frame(height: 120)
    }
}

