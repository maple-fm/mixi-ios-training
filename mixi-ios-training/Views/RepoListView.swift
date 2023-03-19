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

        let url = URL(string: "https://api.github.com/orgs/mixigroup/repos")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = [
            "Accept": "application/vnd.github.v3+json"
        ]

        let (data, _) = try! await URLSession.shared.data(for: urlRequest)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let value = try! decoder.decode([Repo].self, from: data)

        repos = value

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
