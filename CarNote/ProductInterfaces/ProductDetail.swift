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

    
    let Title  : LocalizedStringKey = "Title : "
    let price  : LocalizedStringKey = "Price : "
    let Description  : LocalizedStringKey = "Description : "
    let Delete  : LocalizedStringKey = "Delete"
    let Update_Product  : LocalizedStringKey = "Update Product"
    
    
    var body: some View {
        VStack (alignment: .leading ) {
            
            
            
            
            VStack{
                
                
                AsyncImage(url: URL(string: "http://172.17.2.220:3000/uploads/"+product.image!),
                           content:{ image in
                    image
                        .resizable()
                        .cornerRadius(20)
                        .frame(width: 350)
                        .scaledToFit()
                },placeholder: { })
                
                
                HStack{
                    Text(Title)
                        .font(.title)
                        .fontWeight(.bold).foregroundColor(.blue)
                    Text(product.title)
                        .font(.title)
                        .fontWeight(.bold)
                }
                
                
                
                //                Rating
                
                HStack{
                    
                }
                
                //                Info
                HStack (alignment: .top) {
                    VStack (alignment: .leading) {
                        Text(Description)
                            .fontWeight(.medium)
                            .foregroundColor(.blue)
                        Text(product.description!)
                            .lineSpacing(8.0)
                            .opacity(0.6)
                        HStack{
                            Text(price).foregroundColor(.blue)
                            
                            Text("\(product.prix!,format: .number) €").foregroundColor(.red)
                        }
                        
                        Spacer().frame(width: 30)
                        
                        if product.owned_by! == UserViewModel.currentUser?._id ?? ""
                            
                        {
                            Button(Delete,action:{viewModel.DeleteProduit(_id: product._id!)
                                
                            })
                            .foregroundColor(.white)
                            .frame(width: 100, height: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                            
                            
                            NavigationLink(destination:UpdateProduct(product: product)){
                                Text(Update_Product)
                                    .foregroundColor(.blue)
                                    .frame(width: 180, height: 40)
                                    .background(Color.white)
                                    .cornerRadius(10)
                            }
                        }
                        
                    }
                    
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }.background(.ultraThinMaterial).cornerRadius(20)
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
