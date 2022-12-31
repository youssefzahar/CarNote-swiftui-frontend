//
//  ProductDetailOwnUser.swift
//  carNote
//
//  Created by Apple Esprit on 22/12/2022.
//

import SwiftUI

struct ProductDetailOwnUser: View {
    var product: Product
    @ObservedObject var viewModel = ProduitViewModel()

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
                    Text(UserViewModel.currentUser?._id ?? "")
                    Text(product.owned_by!)



                    if product.owned_by! == UserViewModel.currentUser?._id ?? ""

                    {
                        Button("Delete",action:{viewModel.DeleteProduit(_id: product._id!)
                            
                        })
                        .foregroundColor(.white)
                        .frame(width: 100, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        
                        
                        NavigationLink(destination:UpdateProduct(product: product)){
                            Text("Update Product")
                                .foregroundColor(.blue)
                                .frame(width: 180, height: 40)
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                    }
                    
                        
                    
                }
                
                .padding()
                .frame(width: 180 , alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            }
            .frame(width: 180, height: 500)
            .shadow(radius: 3)
        }

    }}

struct ProductDetailOwnUser_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailOwnUser(product : productList[0])
    }
}
