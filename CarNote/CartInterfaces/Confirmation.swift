//
//  Confirmation.swift
//  carNote
//
//  Created by youssef-mariem on 20/12/2022.
//

import SwiftUI

struct Confirmation: View {
    let paymentcomplet  : LocalizedStringKey = "Payment Completed!"

    var body: some View {
        Text(paymentcomplet)
    }
}

struct Confirmation_Previews: PreviewProvider {
    static var previews: some View {
        Confirmation()
    }
}
