//
//  ContentView.swift
//  mixi-ios-training
//
//  Created by 出口楓真 on 2023/03/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {

            Image("github-mark")
                .resizable()
                .frame(width: 44, height: 44)

            VStack(alignment: .leading) {
                Text("Owner Name")
                    .font(.caption)

                Text("Repository Name")
                    .font(.body)
                    .fontWeight(.semibold)

            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
