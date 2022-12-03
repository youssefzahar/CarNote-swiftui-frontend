//
//  ProductsView.swift
//  Car
//
//  Created by youssef-mariem on 3/12/2022.
//

import SwiftUI

struct ProductsView: View {
    @EnvironmentObject var viewModel: ProductViewModel
    @State var isPresentedNewProduct = false
    @State var title = ""
    @State var description = ""
    @State var stock = 0
    @State var prix = 0
    var body: some View {
        NavigationView(){
            List{
                ForEach(viewModel.items , id: \.id){ item in
                    NavigationLink(destination: UpdateProductView(item: item), label: {
                        VStack(alignment: .leading){
                            Text(item.title)
                            Text(item.description).font(.caption).foregroundColor(.gray)
                            Text("\(item.prix)DT").font(.caption).foregroundColor(.gray)
                            Text("\(item.stock)").font(.caption).foregroundColor(.gray)
                        }
                    })
                    
                }.onDelete(perform:deletePost)
                
            }.listStyle(InsetListStyle())
            .navigationTitle("Products")
                .navigationBarItems(trailing: plusButton)
        }.sheet(isPresented: $isPresentedNewProduct, content: {
            NewProductView(isPresented: $isPresentedNewProduct, title: $title, description: $description, stock: $stock, prix: $prix)
        })

    }
    
    
    private func deletePost(indexSet: IndexSet){
        let id = indexSet.map{viewModel.items[$0].id}
        DispatchQueue.main.async {
                let parameters: [String:Any] = ["productID":id[0]]
                print(id)
                self.viewModel.deleteProduct(parameters: parameters)
                self.viewModel.fetchProducts()
            }
        
    }
    
    var plusButton: some View {
        Button(action: {
            isPresentedNewProduct.toggle()
        }, label: {Image(systemName: "plus")
            
        })
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
