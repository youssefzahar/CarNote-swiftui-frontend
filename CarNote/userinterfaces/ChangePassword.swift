//
//  ChangePassword.swift
//  carNote
//
//  Created by Apple Esprit on 23/12/2022.
//

import SwiftUI

struct ChangePassword: View {
    @State private var password=""
    @ObservedObject var viewModel = UserViewModel()
    var body: some View {
        NavigationView{
            ZStack{
                Text(" Change Password ").font(.system(size: 50, design: .rounded)).bold().padding().foregroundColor(.blue).offset(x:0,y:-300)
                VStack  (alignment: .leading, spacing: 10){
                    
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
                            
                            NavigationLink(destination:UserProfileView()){ Button("Save Profile", action:{
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
                    
                }
              
            
               

            }
        }
        .navigationBarHidden(true)
        
    }
}

struct ChangePassword_Previews: PreviewProvider {
    static var previews: some View {
        ChangePassword()
    }
}
