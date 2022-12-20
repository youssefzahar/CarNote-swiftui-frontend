//
//  ProductUIView.swift
//  carNote
//
//  Created by youssef-mariem on 6/12/2022.
//

import SwiftUI

struct ProductUIView: View {
    
    @EnvironmentObject var cartManager: CartManager
    @State private var isActive: Bool = false

  
    var product: Product
    
    
    
   /* private func startCheckout(completion: @escaping (String?) -> Void) {
        
        let url = URL(string: "https://mango-persistent-organ.glitch.me/create-payment-intent")!

                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = try! JSONEncoder().encode(cartManager.ListProducts)
                
                URLSession.shared.dataTask(with: request) { data, response, error in
                        
                    guard let data = data, error == nil,
                          (response as? HTTPURLResponse)?.statusCode == 200
                    else {
                        completion(nil)
                        return
                    }
                    
                    let checkoutIntentResponse = try? JSONDecoder().decode(CheckoutIntentResponse.self, from: data)
                    completion(checkoutIntentResponse?.clientSecret)

                }.resume()
            
        }*/
    
    
    var body: some View {
        ZStack(alignment: .topLeading){
            ZStack(alignment: .bottom){
                Image("P4")
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 180)
                    .scaledToFit()
                VStack(alignment: .leading){
                    Text(product.title)
                        .bold()
                    Text("\(product.prix!,format: .number)DT")
                        .font(.caption)
                }
                .padding()
                .frame(width: 180 , alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            }
            .frame(width: 180, height: 250)
            .shadow(radius: 3)
            Button{
                cartManager.addToCart( product : product)
            }label: {
             Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(50)
                    .padding()
            }
        }
       /* NavigationLink(isActive: $isActive) {
            CheckoutView()
                        } label: {
                            Button("Checkout") {
                                startCheckout{ clientSecret in
                                    
                                    PaymentConfig.shared.paymentIntentClientSecret = clientSecret
                                    
                                    DispatchQueue.main.async {
                                                                    isActive = true
                                                                }
                                    
                                }

                            }
                        }*/
    }}

struct ProductUIView_Previews: PreviewProvider {
    static var previews: some View {
        ProductUIView(product : productList[0]).environmentObject(CartManager())
    }
}
