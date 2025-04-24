//
//  DetailView.swift
//  LOR_POC
//
//  Created by Dineshkumar on 21/04/25.
//  Copyright © 2025 LOR_POCOrganizationName. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var title: String

    var body: some View {
        VStack {
            Text("Detail View")
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .navigationTitle(title)
    }
}
