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
                 NavigationLink{
                 CartView()
                 .environmentObject(cartManager)
                 } label: {
                 CartButton(numberOfProducts: cartManager.ListProducts.count)
                 
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
    
