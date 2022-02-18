//
//  View-ExpenseStyling.swift
//  iExpense
//
//  Created by Miks Latvis on 18/02/2022.
//

import SwiftUI

extension View {
    func style(for item: ExpenseItem) -> some View {
        if item.amount < 10 {
            return self.font(.body)
        } else if item.amount < 100 {
            return self.font(.title3)
        } else {
            return self.font(.title)
        }
    }
}
