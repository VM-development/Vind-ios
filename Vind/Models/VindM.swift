//
//  VindM.swift
//  Vind
//
//  Created by Vadym Malakhatko on 24.09.2023.
//

import Foundation

struct Vind: Identifiable, Codable {
    var id: String?
    var title: String
    var friendsOnly: Bool
    var userId: String
    var date: Date
    var durationSeconds: Int
}
