//
//  Repo.swift
//  mixi-ios-training
//
//  Created by 出口楓真 on 2023/03/18.
//

import Foundation

struct Repo: Identifiable {
    var id: Int
    var name: String
    var owner: User
    var description: String
    var stargazersCount: Int
}
