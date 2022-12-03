//
//  UpdateProductView.swift
//  Car
//
//  Created by youssef-mariem on 3/12/2022.
//

import SwiftUI

struct UpdateProductView: View {
    @EnvironmentObject var viewModel: ProductViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var title = ""
    @State var description = ""
    @State var stock = 0
    @State var prix = 0
    let item : ProductModel
    var body: some View {
        ZStack{
            Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
                Text("Edit Product").font(Font.system(size:16, weight: .bold))
                
                TextField("Title",text: $title).padding().background(Color.white).cornerRadius(6).padding(.bottom)
                TextField("Description ...",text: $description).padding().background(Color.white).cornerRadius(6).padding(.bottom)
                TextField("Prix", value: $prix, format: .number).padding().background(Color.white).cornerRadius(6).padding(.bottom)
                TextField("Stock", value: $stock, format: .number).padding().background(Color.white).cornerRadius(6).padding(.bottom)
                
                Spacer()
                
            }.padding()
                .onAppear(perform: {
                    self.title = item.title
                    self.description = item.description
                    self.stock = item.stock
                    self.prix = item.prix
                })
            
        } .navigationBarTitle("Edit Post", displayMode: .inline)
            .navigationBarItems(trailing: trailing)     }
    
    
    var trailing: some View {
        Button(action: {
            if title != "" && description != "" && prix != 0 && stock != 0 {
                let parameters: [String:Any] = ["id":item.id ,"title":title, "description":description, "prix":prix, "stock":stock,]
                viewModel.updateProduct(parameters: parameters)
                viewModel.fetchProducts()
                presentationMode.wrappedValue.dismiss()
            }
        }, label: {
            Text("Save")
        })
    }
}

/*struct UpdateProductView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateProductView()
    }
}*/
