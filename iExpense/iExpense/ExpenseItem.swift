//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Miks Latvis on 17/02/2022.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
