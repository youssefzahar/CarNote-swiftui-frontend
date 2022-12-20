//
//  ModifyUserView.swift
//  carNote
//
//  Created by youssef-mariem on 17/12/2022.
//

import SwiftUI

struct ModifyUserView: View {
    @State private var first_name=""
            @State private var last_name=""
   // @State public var image: UIImage
    @State private var phone_number=""
    //@Binding public var email :String
   // @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil

    @ObservedObject var viewModel = UserViewModel()
    var body: some View {
        NavigationView{
            ZStack{
                Text("Modify Your Profile !").font(.system(size: 50, design: .rounded)).bold().padding().foregroundColor(.blue).offset(x:0,y:-300)
                VStack  (alignment: .leading, spacing: 10){
                    /*  Image("logo").resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100).clipShape(Circle()).padding()*/
                    
                    VStack{
                        
                        Text("First Name  : ").font(.system(size: 20, design: .rounded)).bold().padding().foregroundColor(.blue).offset(x:-110)
                        
                        HStack{
                            Image(systemName: "person").foregroundColor(.blue)
                                .foregroundColor(.gray).font(.headline)
                            TextField("First Name", text: $viewModel.first_name)
                                .padding()
                            .frame(width: 300, height: 30)}
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                    }
                    
                    VStack {
                        Text("Last Name  : ").font(.system(size: 20, design: .rounded)).bold().padding().foregroundColor(.blue).offset(x:-110)
                        HStack{
                            Image(systemName: "person").foregroundColor(.blue)
                                .foregroundColor(.gray).font(.headline)
                            
                            TextField("Last Name", text: $viewModel.last_name)
                                .padding()
                            .frame(width: 300, height: 30)}
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                        
                    }
                    
                    
                    
                  
                    VStack{
                        Text("Phone Number : ").font(.system(size: 20, design: .rounded)).bold().padding().foregroundColor(.blue).offset(x:-110)
                        HStack{
                            Image(systemName: "phone").foregroundColor(.blue)
                                .foregroundColor(.gray).font(.headline)
                            TextField("Phone Number", text: $viewModel.phone_number)
                                .padding()
                            .frame(width: 300, height: 30)} .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                        
                    }
                    
                    
                    VStack{
                        
                        HStack {
                            
                            NavigationLink(destination:UserProfileView(/*email:$email*/)){ Button("Save Profile", action:{
                                viewModel.UpdateUser(email: viewModel.email,first_name:viewModel.first_name, last_name:viewModel.last_name, phone_number:viewModel.phone_number,
                                                     image:viewModel.image)  //image!)
                            })
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                                
                            }
                            
                        }
                    }
                
                 /*    HStack {
                     Text("Already have any account ?").font(.system(size: 15, design: .rounded)).foregroundColor(.gray)
                     
                     NavigationLink(destination:LoginScreenView(isLogin: false)){
                     
                     
                     Text("Sign In")
                     .foregroundColor(.blue)
                     .frame(width: 80, height: 40)
                     .cornerRadius(10)
                     //.offset(x:-80,y:)
                     
                     }
                     }*/
                    
                    
                    
                }
              
            
               

            }
        }
        .navigationBarHidden(true)
        
    }
}

struct ModifyUserView_Previews: PreviewProvider {
    static var previews: some View {
        ModifyUserView()
    }
}
