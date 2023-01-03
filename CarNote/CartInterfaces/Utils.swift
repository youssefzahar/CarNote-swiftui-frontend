//
//  Utils.swift
//  carNote
//
//  Created by youssef-mariem on 20/12/2022.
//

import Foundation
func formatPrice(_ prix: Int) -> String? {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return formatter.string(from: NSNumber(value: prix))
}
