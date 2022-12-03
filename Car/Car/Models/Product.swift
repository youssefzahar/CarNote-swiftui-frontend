//
//  Product.swift
//  Car
//
//  Created by youssef-mariem on 3/12/2022.
//

import Foundation
import SwiftUI

struct DataModel: Decodable {
    let error: Bool
    let message: String
    let data: [ProductModel]
}


struct ProductModel: Decodable,Identifiable {
    let id: Int
    let title: String
    let stock : Int
    let prix : Int
    let description : String
}
