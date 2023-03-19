//
//  ContentView.swift
//  mixi-ios-training
//
//  Created by 出口楓真 on 2023/03/18.
//

import SwiftUI

@MainActor
class RepoStore: ObservableObject {
    @Published private(set) var repos = [Repo]()

    func loadRepos() async {

        try! await Task.sleep(nanoseconds: 1_000_000_000)
        repos = [.mock1, .mock2, .mock3, .mock4, .mock5]
    }
}

struct RepoListView: View {

    @StateObject private var repoStore = RepoStore()

    var body: some View {
        NavigationView {
            if repoStore.repos.isEmpty {
                ProgressView("Loading ...")

            } else {

                List(repoStore.repos) { repo in

                    NavigationLink(
                        destination: RepoDetailView(repo: repo)) {
                        RepoRow(repo: repo)
                    }
                }
                .navigationTitle("Repositories")
            }
        }
        .task {
            await repoStore.loadRepos()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RepoListView()
    }
}
