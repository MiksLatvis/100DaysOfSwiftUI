//
//  FormatStyle-LocalCurrency.swift
//  iExpense
//
//  Created by Miks Latvis on 18/02/2022.
//

import Foundation

extension FormatStyle where Self == FloatingPointFormatStyle<Double>.Currency {
    static var localCurrency: Self {
        .currency(code: Locale.current.currencyCode ?? "EUR")
    }
}
