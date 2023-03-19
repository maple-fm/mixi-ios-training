//
//  Stateful.swift
//  mixi-ios-training
//
//  Created by 出口楓真 on 2023/03/19.
//

import Foundation

enum Stateful<Value> {
    case idle // まだデータ取得していない
    case loading // 読み込み中
    case failed(Error) // 読み込み失敗、遭遇したエラーを保持
    case loaded(Value) // 読み込み完了、読み込まれたデータを保持
}

