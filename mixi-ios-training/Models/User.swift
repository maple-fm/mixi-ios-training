//
//  User.swift
//  mixi-ios-training
//
//  Created by 出口楓真 on 2023/03/18.
//

import Foundation

struct User: Decodable {
    var name: String

    private enum CodingKeys: String, CodingKey {
        case name = "login"
    }


}
