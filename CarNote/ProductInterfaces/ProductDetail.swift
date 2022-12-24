//
//  ProductDetailOwnUser.swift
//  carNote
//
//  Created by Apple Esprit on 22/12/2022.
//

import SwiftUI

struct ProductDetail: View {
    var product: Product
    @ObservedObject var viewModel = ProduitViewModel()

    var body: some View {
            VStack (alignment: .leading) {
                
                Image("logo")
                    .resizable()
                    .aspectRatio(1,contentMode: .fit)
                    .edgesIgnoringSafeArea(.top)
                
                
                HStack{
                    Text("Title : ")
                        .font(.title)
                        .fontWeight(.bold)
                    Text(product.title)
                        .font(.title)
                        .fontWeight(.bold)
                }
                
                //                Rating
                
                Text("Description :")
                    .fontWeight(.medium)
                    .padding(.vertical, 8)
                Text(product.description!)
                    .lineSpacing(8.0)
                    .opacity(0.6)
                
                //                Info
                HStack (alignment: .top) {
                    VStack (alignment: .leading) {
                        HStack{
                            Text("Prix :")
                                .opacity(0.6)
                            Text("\(product.prix!,format: .number) DT").opacity(0.6)
                        }

                        Spacer().frame(width: 30)
                        
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
                    
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.vertical)
            }
            .padding()
            .padding(.top)
            .background(Color("Bg"))
            .cornerRadius(30, corners: [.topLeft, .topRight])
            .offset(x: 0, y: -30.0)
        }
    }
    


struct ProductDetailOwnUser_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetail(product : productList[0])
    }
}