//
//  ContentView.swift
//  mixi-ios-training
//
//  Created by 出口楓真 on 2023/03/18.
//

import SwiftUI

struct RepoListView: View {

    @State private var mockRepos: [Repo] = []

    var body: some View {
        NavigationView {
            if mockRepos.isEmpty {
                ProgressView("Loading ...")

            } else {

                List(mockRepos) { repo in

                    NavigationLink(
                        destination: RepoDetailView(repo: repo)) {
                        RepoRow(repo: repo)
                    }
                }
                .navigationTitle("Repositories")
            }
        }
        .onAppear {
            loadRepos()
        }
    }

    private func loadRepos() {
        // 1秒後にモックデータを読み込む
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            mockRepos = [
                .mock1, .mock2, .mock3, .mock4, .mock5
            ]
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RepoListView()
    }
}
