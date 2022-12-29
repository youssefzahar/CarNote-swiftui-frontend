//
//  AddProductUIView.swift
//  carNote
//
//  Created by youssef-mariem on 26/11/2022.
//

import SwiftUI

struct AddProductUIView: View
{
    @State private var title = ""

 @State private var stock = 0
    @State private var prix = 0

 @State private var description = ""

 @State private var owned_by = ""
 @State private var image = ""
 
 

    @ObservedObject var viewModel = ProduitViewModel()
 
    var body: some View {
        NavigationView {
            
            
            ZStack{
                LinearGradient(gradient:Gradient(colors: [.blue,.white]), startPoint: .topTrailing, endPoint:.bottomLeading)
                    .ignoresSafeArea(.all)
                
                VStackLayout{
                    
                    
                    Text("Add New Product ! ").font(.system(size: 50, design: .rounded)).bold().padding().foregroundColor(.white)
                    
                    VStack(alignment: .leading, spacing: 3){
                        ScrollView{
                            VStack{
                                Text("Product Title : ").font(.system(size: 20, design: .rounded)).bold().padding().foregroundColor(.white).offset(x:-100)
                                
                                HStack{
                                    Image(systemName: "bag.fill.badge.plus").foregroundColor(.blue)
                                        .foregroundColor(.gray).font(.headline)
                                    TextField("Title", text: $viewModel.title)
                                        .padding()
                                    .frame(width: 300, height: 30)}
                                .padding()
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                            }
                            
                            
                            VStack{
                                Text("Product stock : ").font(.system(size: 20, design: .rounded)).bold().padding().foregroundColor(.white).offset(x:-100)
                                
                                HStack{
                                    Image(systemName: "shippingbox.fill").foregroundColor(.blue)
                                    
                                    TextField("Stock",value: $viewModel.stock,format: .number)
                                        .padding()
                                    .frame(width: 300, height: 30)}
                                .padding()
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                            }
                            
                            VStack{
                                Text("Product Price : ").font(.system(size: 20, design: .rounded)).bold().padding().foregroundColor(.white).offset(x:-100)
                                HStack{
                                    Image(systemName: "banknote.fill").foregroundColor(.blue)
                                    TextField("Price",value: $viewModel.prix,format: .number)
                                        .padding()
                                    .frame(width: 300, height: 30)}
                                .padding()
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                            }
                            
                            VStack{
                                
                                Text("Description : ").font(.system(size: 20, design: .rounded)).bold().padding().foregroundColor(.white).offset(x:-100)
                                HStack{
                                    Image(systemName: "line.3.horizontal").foregroundColor(.blue)
                                    
                                    TextField("Description", text : $viewModel.description)
                                        .padding()
                                    .frame(width: 300, height: 30)}
                                .padding()
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                            }
                            
                            
                            Image(uiImage: viewModel.image)
                                .resizable()
                                .frame(width: 300, height: 200)
                                .aspectRatio(contentMode: .fill)
                                .onTapGesture {
                                    viewModel.showFileUpload = true
                                }
                                .sheet(isPresented: $viewModel.showFileUpload) {
                                    ImagePicker(sourceType: .photoLibrary, selectedImage: $viewModel.image)
                                }
                            
                            
                            Spacer()
                            
                    
                        
                            HStack{
                                
                                
                                
                                
                                NavigationLink(destination:UserProfileView()){
                                    Button("Add",action:{viewModel.AddProduct(title:viewModel.title, stock:viewModel.stock, prix:viewModel.prix, description: viewModel.description, owned_by: UserViewModel.currentUser?._id ?? "", image: viewModel.image)
                                        
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


struct AddProductUIView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductUIView()
    }
}
