//
//  RepoRow.swift
//  mixi-ios-training
//
//  Created by 出口楓真 on 2023/03/18.
//

import SwiftUI

struct RepoRow: View {

    let repo: Repo

    var body: some View {
        HStack {
            Image("github-mark")
                .resizable()
                .frame(width: 44, height: 44)

            VStack(alignment: .leading) {
                Text(repo.owner.name)
                    .font(.caption)

                Text(repo.name)
                    .font(.body)
                    .fontWeight(.semibold)

            }
        }
    }
}

struct RepoRow_Previews: PreviewProvider {
    static var previews: some View {
        RepoRow(repo: Repo(id: 1,
                           name: "Test Repo1",
                           owner: User(name: "Test User1"),
                           description: "",
                           stargazersCount: 0))
    }
}
