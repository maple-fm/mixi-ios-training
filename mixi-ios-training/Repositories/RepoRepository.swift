//
//  RepoRepository.swift
//  mixi-ios-training
//
//  Created by 出口楓真 on 2023/03/19.
//

import Foundation

struct RepoRepository {
    func fetchRepos() async throws -> [Repo] {
        try await RepoAPIClient().getRepo()
    }
}
