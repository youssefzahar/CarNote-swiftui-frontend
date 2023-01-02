//
//  CartManager.swift
//  carNote
//
//  Created by youssef-mariem on 25/11/2022.
//

import Foundation
class  CartManager: ObservableObject{
    @Published private (set) var ListProducts : [Product] = []
    @Published private (set) var total: Int = 0
    
    
    func addToCart(product: Product){
        ListProducts.append(product)
        total += product.prix!
    }
    
    func removeFromCart(product: Product){
        ListProducts = ListProducts.filter {$0.id == product.id}
        total -= product.prix!
    }
    
    
    var cartTotal: Int {
            return ListProducts.reduce(0) { result, product in
                result + product.prix!
            }
        }
    
    func emptyCart() {
        ListProducts = []

        }
    
}
