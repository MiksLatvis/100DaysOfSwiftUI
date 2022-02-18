//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Miks Latvis on 17/02/2022.
//

import Foundation

struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
