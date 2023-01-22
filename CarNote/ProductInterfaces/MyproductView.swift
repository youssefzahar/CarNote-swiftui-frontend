//
//  MyproductView.swift
//  carNote
//
//  Created by Apple Esprit on 21/12/2022.
//

import SwiftUI



struct MyproductView: View {
    @State private var isActive: Bool = false

    let Account  : LocalizedStringKey = "Account"
    let ProductShop  : LocalizedStringKey = "Product Shop"

    
        var columns = [GridItem(.adaptive(minimum: 150), spacing: 30)]
        @StateObject var  productViewModel = ProduitViewModel()
    @State var products : [Product] = []
        var body: some View {
           // NavigationView{
                ScrollView{
                    HStack{
                        Text(ProductShop).bold().font(.system(size: 36))
                        Spacer()
                        NavigationLink(isActive: $isActive){
                            UserProfileView()
                        } label: {
                            Text(Account)
                        }
                    }
                    
                    LazyVGrid(columns: columns, spacing: 20){
                        ForEach(0 ..< products.count, id:  \ .self ) {
                            index in
                            NavigationLink(destination: ProductDetail(product : products[index])){
                                ProductUIView2(product : products[index])

                            }                        }
                    }
                    .padding()
                }
                   .navigationTitle(Text(ProductShop))
                 //}.navigationBarHidden(false)
            .onAppear{
                productViewModel.GetMyProducts {success, result in
                    if success {
                        self.products = []
                        self.products.append(contentsOf: result!)
                    }
                }
            }
                 .navigationViewStyle(StackNavigationViewStyle())
            }

        }

        struct MyproductView_Previews: PreviewProvider {
            static var previews: some View {
                ProductUIView(product : productList[0])
            }
        }
