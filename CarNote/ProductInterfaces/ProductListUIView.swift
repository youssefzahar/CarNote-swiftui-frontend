//
//  ProductListUIView.swift
//  carNote
//
//  Created by youssef-mariem on 6/12/2022.
//

import SwiftUI

struct ProductListUIView: View {
    
        var columns = [GridItem(.adaptive(minimum: 150), spacing: 30)]
        @StateObject var  productViewModel = ProduitViewModel()
        @StateObject var cartManager = CartManager()
    @State var products : [Product] = []
    @State private var isActive: Bool = false

    
    
    private func startCheckout(completion: @escaping (String?) -> Void) {
       
        let url = URL(string: "http://172.17.1.254:3000/create-payment-intent")!

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
        
    }
    
    
        var body: some View {
            NavigationView{
                ScrollView{
                    LazyVGrid(columns: columns, spacing: 20){
                        ForEach(0 ..< products.count, id:  \ .self ) {
                            index in ProductUIView(product : products[index])
                                .environmentObject(cartManager)
                        }
                    }
                    .padding()

                }
                
                   .navigationTitle(Text("Product Shop"))
                 .toolbar{
                CartButton(numberOfProducts: cartManager.ListProducts.count)
                 NavigationLink(isActive: $isActive){
                 CartView()
                 .environmentObject(cartManager)
                 } label: {
                     Button("Checkout") {
                                             startCheckout { clientSecret in
                                                 
                                                 PaymentConfig.shared.paymentIntentClientSecret = clientSecret
                                                 
                                                 DispatchQueue.main.async {
                                                     isActive = true
                                                 }
                                             }
                                         }
                 
                 }
                 }
                 }
            .onAppear{
                productViewModel.GetProducts {success, result in
                    if success {
                        self.products = []
                        self.products.append(contentsOf: result!)
                    }
                }
            }
                 .navigationViewStyle(StackNavigationViewStyle())
            }
            
        }
    
        struct ProductListUIView_Previews: PreviewProvider {
            static var previews: some View {
                ProductUIView(product : productList[0]).environmentObject(CartManager())
            }
        }
    
