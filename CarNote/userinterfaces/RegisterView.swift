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
            @State private var cin=0
            @State private var password=""
            @State private var email=""
        @State private var phone_number=""
        //@State private var image=""
    @ObservedObject var viewModel = UserViewModel()
    var roles = ["User", "Vendeur"]
    @State private var role="User"
    
    /// translation
    let First_Name:LocalizedStringKey = "First Name"
    let Last_Name:LocalizedStringKey = "Last Name"
    let Phone_Number:LocalizedStringKey = "Phone Number"
    let account_exist:LocalizedStringKey = "Already have any account ?"
    let Sign_In:LocalizedStringKey = "Sign In"


        var body: some View {
            NavigationView{
                ZStack{
                    ScrollView{
                    VStack  (alignment: .leading, spacing: 30){
                        /*  Image("logo").resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100).clipShape(Circle()).padding()*/
                        
                        Text("Register").font(.system(size: 50, design: .rounded)).bold().padding().foregroundColor(.blue).offset(x:0,y:0)
                        
                        
                            
                            HStack{
                                Image(systemName: "person").foregroundColor(.blue)
                                    .foregroundColor(.gray).font(.headline)
                                TextField(First_Name, text: $viewModel.first_name)
                                    .padding()
                                .frame(width: 300, height: 30)}
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                            
                            
                            HStack{
                                Image(systemName: "person").foregroundColor(.blue)
                                    .foregroundColor(.gray).font(.headline)
                                
                                TextField(Last_Name, text: $viewModel.last_name)
                                    .padding()
                                .frame(width: 300, height: 30)}
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                            
                            HStack{
                                Image(systemName: "person").foregroundColor(.blue)
                                    .foregroundColor(.gray).font(.headline)
                                TextField("Cin", text: $viewModel.cin)
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
                                TextField(Phone_Number, text: $viewModel.phone_number)
                                    .padding()
                                .frame(width: 300, height: 30)} .padding()
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                            
                            HStack{
                                Image(systemName: "person").foregroundColor(.blue)
                                    .foregroundColor(.gray).font(.headline)
                                
                                
                              /*  Picker("Please choose a color", selection: $viewModel.role) {
                                                ForEach(roles, id: \.self) {
                                                    Text($0)
                                                }
                                            }*/
                                TextField("role", text: $viewModel.role)
                                    .padding()
                                .frame(width: 300, height: 30)}
                            .padding()
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                            /*     Button("Upload image"){}
                             .foregroundColor(.blue)
                             .frame(width: 300, height: 50)
                             .background(Color.white)
                             .cornerRadius(10)*/
                            /*    TextField("image", text: $viewModel.image)
                             .padding()
                             .frame(width: 300, height: 50)
                             .background(Color.black.opacity(0.05))
                             .cornerRadius(10)*/
                            
                            
                            HStack {
                                NavigationLink(destination:VerifView()){
                                    Button("Register",action:{viewModel.Register(first_name:viewModel.first_name, last_name:viewModel.last_name, cin:Int(viewModel.cin) ?? 0, email: viewModel.email, password: viewModel.password, phone_number:viewModel.phone_number, role:viewModel.role, image:viewModel.image) //image:viewModel.image?
                                        
                                    })
                                    .foregroundColor(.white)
                                    .frame(width: 100, height: 50)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                    //.offset(x:0,y:300)
                                    
                                    
                                    
                                }
                            }
                            
                            HStack {
                                Text(account_exist).font(.system(size: 15, design: .rounded)).foregroundColor(.gray)
                                
                                NavigationLink(destination:LoginScreenView(isLogin: false)){
                                    
                                    
                                    Text(Sign_In)
                                        .foregroundColor(.blue)
                                        .frame(width: 80, height: 40)
                                        .cornerRadius(10)
                                    //.offset(x:-80,y:)
                                    
                                }
                            }
                            
                            
                            
                        }
                    }
                  
                
                   

                }
            }
            .navigationBarHidden(true)
            
        }
    }

    struct RegisterView_Previews: PreviewProvider {
        static var previews: some View {
            RegisterView()
        }
    }
