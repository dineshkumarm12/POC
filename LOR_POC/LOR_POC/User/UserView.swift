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
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                if let user = viewModel.userInfo {
                    Text("Name: \(user.displayName)")
                    Text("User Name: \(user.username)")
                    Text("Nick Name: \(user.nickName)")
                    Text("Email: \(user.email)")
                    Text("Mobile Phone: \(user.mobilePhone ?? "")")
                    Text("Country: \(user.addrCountry ?? "")")
                    Text("User is Active : \(user.active)")
                } else {
                    ProgressView("Loading user...")
                        .onAppear {
                            viewModel.fetchLoggedInUserInfo()
                        }
                }
            }
        }
        .padding()
        .navigationTitle("LOR")
    }
}

struct UserView_Previews: PreviewProvider {
  static var previews: some View {
      UserView()
  }
}
