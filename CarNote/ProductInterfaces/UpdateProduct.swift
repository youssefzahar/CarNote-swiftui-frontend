//
//  UpdateProduct.swift
//  carNote
//
//  Created by Apple Esprit on 22/12/2022.
//

import SwiftUI

struct UpdateProduct: View {
    var product: Product
    @ObservedObject var viewModel = ProduitViewModel()
 
    let AddNewProduct  : LocalizedStringKey = "Add New Product ! "
    let Stock  : LocalizedStringKey = "Stock : "
    let price  : LocalizedStringKey = "Price : "
    let Description  : LocalizedStringKey = "Description : "
    let Update_Product  : LocalizedStringKey = "Update Product"
    
    
    var body: some View {
        NavigationView {
            
            ZStack{
                LinearGradient(gradient:Gradient(colors: [.blue,.white]), startPoint: .topTrailing, endPoint:.bottomLeading)
                    .ignoresSafeArea(.all)
                
                VStackLayout{
                    
                    Text("Update Product ").font(.system(size: 50, design: .rounded)).bold().padding().foregroundColor(.white)
                    
                    VStack(alignment: .leading, spacing: 3){
                        ScrollView{
                            
                            VStack{
                                Text(Stock).font(.system(size: 20, design: .rounded)).bold().padding().foregroundColor(.white).offset(x:-100)
                                
                                HStack{
                                    Image(systemName: "shippingbox.fill").foregroundColor(.blue)
                                    
                                    TextField("\(product.stock!,format: .number)",value: $viewModel.stock,format: .number)
                                        .padding()
                                    .frame(width: 300, height: 30)}
                                .padding()
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                            }
                            
                            VStack{
                                Text(price).font(.system(size: 20, design: .rounded)).bold().padding().foregroundColor(.white).offset(x:-100)
                                HStack{
                                    Image(systemName: "banknote.fill").foregroundColor(.blue)
                                    TextField("\(product.prix!,format: .number)",value: $viewModel.prix,format: .number)
                                        .padding()
                                    .frame(width: 300, height: 30)}
                                .padding()
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                            }
                            
                            VStack{
                                
                                Text(Description).font(.system(size: 20, design: .rounded)).bold().padding().foregroundColor(.white).offset(x:-100)
                                HStack{
                                    Image(systemName: "line.3.horizontal").foregroundColor(.blue)
                                    
                                    TextField(product.description!, text : $viewModel.description)
                                        .padding()
                                    .frame(width: 300, height: 30)}
                                .padding()
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                            }
                            
                            Spacer()
                            
                            HStack{
                                NavigationLink(destination:ProductListUIView()){
                                    Button(Update_Product,action:{viewModel.UpdateProduit(_id: product._id!, stock: viewModel.stock, prix: viewModel.prix, description: viewModel.description)
                                        
                                    })
                                    .foregroundColor(.white)
                                    .frame(width: 100, height: 50)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                    
                                    
                                }
                                
                            }
                            
                            
                        }
                    }}
            }
            .navigationBarHidden(true)
            
        }}
}

struct UpdateProduct_Previews: PreviewProvider {
    static var previews: some View {
        UpdateProduct(product: productList[0])
    }
}
