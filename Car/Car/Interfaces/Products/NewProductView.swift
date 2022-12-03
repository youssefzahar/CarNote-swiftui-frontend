//
//  NewProductView.swift
//  Car
//
//  Created by youssef-mariem on 3/12/2022.
//

import SwiftUI

struct NewProductView: View {
    @EnvironmentObject var viewModel: ProductViewModel
    @Binding var isPresented : Bool
    @Binding var title : String
    @Binding var description : String
    @Binding var stock : Int
    @Binding var prix : Int
    @State var isAlert = false
    var body: some View {
        NavigationView{
            ZStack{
                Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading){
                    Text("Create New Product").font(Font.system(size:16, weight: .bold))
                    
                    TextField("Title",text: $title).padding().background(Color.white).cornerRadius(6).padding(.bottom)
                    TextField("Description ...",text: $description).padding().background(Color.white).cornerRadius(6).padding(.bottom)
                    TextField("Prix", value: $prix, format: .number).padding().background(Color.white).cornerRadius(6).padding(.bottom)
                    TextField("Stock", value: $stock, format: .number).padding().background(Color.white).cornerRadius(6).padding(.bottom)
                    
                    Spacer()
                    
                }.padding()
                    .alert(isPresented: $isAlert, content: {
                        let title = Text("No Data")
                        let message = Text("fill values")
                        return Alert(title: title, message: message)
                        
                    })
                
            } .navigationBarTitle("New Post", displayMode: .inline)
                .navigationBarItems(leading: leading, trailing: trailing)
        }
    }
    
    
    
    
    var leading: some View {
        Button(action: {
            isPresented.toggle()
        }, label: {
            Text("Cancel")
        })
    }
    
    
    var trailing: some View {
        Button(action: {
            if title != "" && description != "" && prix != 0 && stock != 0 {
                let parameters: [String:Any] = ["title":title, "description":description, "prix":prix, "stock":stock,]
                viewModel.createProduct(parameters: parameters)
                viewModel.fetchProducts()
                isPresented.toggle()
            } else {
                isAlert.toggle()
            }
            
        }, label: {
            Text("Post")
        })
    }
}

/*struct NewProductView_Previews: PreviewProvider {
    static var previews: some View {
        NewProductView()
    }
}*/
