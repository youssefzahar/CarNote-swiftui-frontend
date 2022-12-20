//
//  PaymentConfig.swift
//  carNote
//
//  Created by youssef-mariem on 20/12/2022.
//

import Foundation

class PaymentConfig {
    
    var paymentIntentClientSecret: String?
    static var shared: PaymentConfig = PaymentConfig()
    
    private init() { }
}
