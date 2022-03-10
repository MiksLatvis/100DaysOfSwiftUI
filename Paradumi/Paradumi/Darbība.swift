//
//  Darbība.swift
//  Paradumi
//
//  Created by Miks Latvis on 10/03/2022.
//

import Foundation

struct Activity: Codable, Identifiable, Equatable {
    var id = UUID()
    var title: String
    var description: String
    var completionCount = 0

    static let example = Activity(title: "Aktivitātes paraugs", description: "Šis ir aktivitātes paraugs.")
}
