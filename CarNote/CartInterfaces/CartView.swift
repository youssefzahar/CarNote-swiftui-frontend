//
//  CartView.swift
//  carNote
//
//  Created by youssef-mariem on 25/11/2022.
//

import SwiftUI
import Stripe


struct CartView: View {
    @EnvironmentObject var cartManager : CartManager
    @State private var message: String = ""
    @State private var isSuccess: Bool = false
    @State private var paymentMethodParams: STPPaymentMethodParams?
    @State private var ListProducts : [Product] = []

    let paymentGateway = PaymentGateway()
    
    let payinfo  : LocalizedStringKey = "Payment Information"
    let PayButton  : LocalizedStringKey = "Pay"
    let chariot  : LocalizedStringKey = "My Cart"

    
    private func pay() {
        
        guard let clientSecret = PaymentConfig.shared.paymentIntentClientSecret else {
            return
        }
        
        let paymentIntentParams = STPPaymentIntentParams(clientSecret: clientSecret)
        paymentIntentParams.paymentMethodParams = paymentMethodParams
        
        paymentGateway.submitPayment(intent: paymentIntentParams) { status, intent, error in
            
            switch status {
                case .failed:
                    message = "Failed"
                case .canceled:
                    message = "Cancelled"
                case .succeeded:
                    message = "Your payment has been successfully completed!"
                //cartManager.emptyCart()
            }
            
        }
        
    }
    
    
    var body: some View {
        
        ScrollView{
            if cartManager.ListProducts.count > 0 {
                ForEach(cartManager.ListProducts, id:  \.id){
                    product in
                    ProductRowView(product : product)
                }
                HStack{
                  
                    Spacer()
                    Text("\(cartManager.total) DT")
                        .bold()
                }
                
                Section {
                    // Stripe Credit Card TextField Here
                    STPPaymentCardTextField.Representable.init(paymentMethodParams: $paymentMethodParams)
                } header: {
                    Text(payinfo)
                }
                
                HStack {
                    Spacer()
                    Button(PayButton) {
                        pay()
                    }.buttonStyle(.plain)
                    Spacer()
                }
                
                Text(message)
                    .font(.headline)
                
                
            }
            
            NavigationLink(isActive: $isSuccess, destination: {
                Confirmation()
            }, label: {
                EmptyView()
            })
            
            /*else {
                Text("Your cart is empty")
            }*/
            
        }
        
        
        .navigationTitle(Text(chariot))
        .padding(.top)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
