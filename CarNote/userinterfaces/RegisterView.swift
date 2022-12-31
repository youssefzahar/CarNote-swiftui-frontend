//
//  RegisterView.swift
//  carNote
//
//  Created by youssef-mariem on 12/11/2022.
//

import SwiftUI

struct RegisterView: View {
    @State private var first_name=""
            @State private var last_name=""
            @State private var user_name=""
            @State private var password=""
            @State private var email=""
        @State private var phone_number=""
        //@State private var image=""
    @ObservedObject var viewModel = UserViewModel()
    var roles = ["User", "Vendeur"]
    @State private var role="User"

        var body: some View {
           // NavigationView{
                ZStack{
                    ScrollView{
                    VStack  (alignment: .leading, spacing: 30){
                        /*  Image("logo").resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100).clipShape(Circle()).padding()*/
                        
                        Text("Register").font(.system(size: 50, design: .rounded)).bold().padding().foregroundColor(.blue).offset(x:0,y:0)
                        
                        
                            
                            HStack{
                                Image(systemName: "person").foregroundColor(.blue)
                                    .foregroundColor(.gray).font(.headline)
                                TextField("First Name", text: $viewModel.first_name)
                                    .padding()
                                .frame(width: 300, height: 30)}
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                            
                            
                            HStack{
                                Image(systemName: "person").foregroundColor(.blue)
                                    .foregroundColor(.gray).font(.headline)
                                
                                TextField("Last Name", text: $viewModel.last_name)
                                    .padding()
                                .frame(width: 300, height: 30)}
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                            
                            HStack{
                                Image(systemName: "person").foregroundColor(.blue)
                                    .foregroundColor(.gray).font(.headline)
                                TextField("User Name", text: $viewModel.user_name)
                                    .padding()
                                .frame(width: 300, height: 30)}
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                            HStack{
                                Image(systemName: "envelope").foregroundColor(.blue)
                                    .foregroundColor(.gray).font(.headline)
                                TextField("Email", text: $viewModel.email)
                                    .padding()
                                .frame(width: 300, height: 30)}
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                            
                            HStack{
                                Image(systemName: "lock.circle").foregroundColor(.blue)
                                    .foregroundColor(.gray).font(.headline)
                                SecureField("Password", text: $viewModel.password)
                                    .padding()
                                    .frame(width: 275, height: 30)                                //.background(Color.black.opacity(0.05))
                                Image(systemName: "eye.slash")
                                    .foregroundColor(.blue).font(.headline)
                                
                                
                            }
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                            
                            
                            HStack{
                                Image(systemName: "phone").foregroundColor(.blue)
                                    .foregroundColor(.gray).font(.headline)
                                TextField("Phone Number", text: $viewModel.phone_number)
                                    .padding()
                                .frame(width: 300, height: 30)} .padding()
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                            
                            HStack{
                                Image(systemName: "person").foregroundColor(.blue)
                                    .foregroundColor(.gray).font(.headline)
                                
                                
                                Picker("Role", selection: $role) {
                                                ForEach(roles, id: \.self) {
                                                    Text($0)
                                                }
                                            }
                               /* TextField("role", text: $viewModel.role)
                                    .padding()*/
                                .frame(width: 300, height: 30)}
                            .padding()
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                            
                            
                            HStack {
                                Spacer().frame(width: 55)
                                NavigationLink(destination: VerifView()){
                                    Text("Register").foregroundColor(.white)
                                }
                                .foregroundColor(.white)
                                .frame(width: 250, height: 50)
                                .background(Color.blue)
                                .cornerRadius(10)
                                .simultaneousGesture(TapGesture().onEnded{
                                    viewModel.Register(first_name:viewModel.first_name, last_name:viewModel.last_name, user_name:viewModel.user_name, email: viewModel.email, password: viewModel.password, phone_number:viewModel.phone_number, role:role)
                                })
                            }
                            
                         /*   HStack {
                                Text("Already have any account ?").font(.system(size: 15, design: .rounded)).foregroundColor(.gray)
                                Spacer().frame(width: 100)
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
           // }
          //  .navigationBarHidden(true)
            
        }
    }

    struct RegisterView_Previews: PreviewProvider {
        static var previews: some View {
            RegisterView()
        }
    }
