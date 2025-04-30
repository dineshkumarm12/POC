//
//  SceneDelegate.swift
//  LOR
//
//  Created by Dineshkumar on 24/04/25.
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
