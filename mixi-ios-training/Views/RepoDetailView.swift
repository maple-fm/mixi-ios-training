//
//  RepoDetailView.swift
//  mixi-ios-training
//
//  Created by 出口楓真 on 2023/03/18.
//

import SwiftUI

struct RepoDetailView: View {

    let repo: Repo

    var body: some View {
        
        ScrollView {
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Image("github-mark")
                            .resizable()
                            .frame(width: 16, height: 16)
                        Text(repo.owner.name)
                            .font(.caption)
                    }
                    Text(repo.name)
                        .font(.body)
                        .fontWeight(.bold)

                    Text(repo.description)
                        .padding(.top, 4)

                    HStack {
                        Image(systemName: "star")

                        Text("^[\(repo.stargazersCount) stars](inflect: true)")
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding(.top, 8)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct RepoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RepoDetailView(repo: .mock1)
    }
}
