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

    var body: some View {
        VStack(spacing: 10) {
            if let user = viewModel.userInfo {
                Text("👤 \(user.name)")
                Text("📧 \(user.email)")
                Text("🆔 ID: \(user.id)")
            } else {
                ProgressView("Loading user...")
                    .onAppear {
                        viewModel.fetchLoggedInUserInfo()
                    }
            }
        }
        .padding()
    }
}

struct UserView_Previews: PreviewProvider {
  static var previews: some View {
      UserView()
  }
}
