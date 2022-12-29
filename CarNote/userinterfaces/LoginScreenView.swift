//
//  LoginScreenView.swift
//  carNote
//
//  Created by youssef-mariem on 12/11/2022.
//

import SwiftUI

struct LoginScreenView: View {
    @State private var user_name=""
        @State private var password=""
    @State var isLogin :Bool
        @ObservedObject var viewModel = UserViewModel()
    
    //translation
    let Login : LocalizedStringKey = "Login"
    
    
        var body: some View {
            NavigationView{
                ZStack{
                    Color.blue.ignoresSafeArea()
                    Circle().scale(1.7).foregroundColor(.white.opacity(0.15))
                    Circle().scale(1.50).foregroundColor(.white)
                    VStack{
                        Image("logo").resizable().aspectRatio(contentMode: .fill).frame(width: 180, height: 200).clipShape(Circle())
                        Text(Login).font(.system(size: 34, design: .rounded)).bold().padding().foregroundColor(.blue)
                        
                        HStack{
                            Image(systemName: "envelope").foregroundColor(.blue)
                                .foregroundColor(.gray).font(.headline)
                            TextField("User Name", text: $viewModel.user_name)
                                .padding()
                                .frame(width: 300, height: 30)
                            // .background(Color.black.opacity(0.05))
                            //.cornerRadius(10)
                        }
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
                        
                        
                        NavigationLink(destination:ControlLogin() .navigationBarBackButtonHidden(true), isActive: $isLogin){
                            
                            Button("Login", action: {
                                
                                viewModel.LogIn(user_name: viewModel.user_name, password: viewModel.password,complited: {(user ) in
                                    
                                    if let  _ = user {
                                        
                                        print("logged in ")
                                        
                                        isLogin=true
                                        
                                    }else{
                                        
                                        print("not loged in ")
                                        
                                        isLogin=false
                                        
                                    }
                                    
                                })
                              
                                
                                
                            }
                                     
                                   
                            )
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                            
                            
                            
                        }
                        NavigationLink(destination:ForgotPasswordView()){
                            Text("Forgot Password ?")
                                .foregroundColor(.blue)
                                .frame(width: 180, height: 40)
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                        
                        /*
                         NavigationLink(destination:HomeView(/*email:$email*/)){ Button("Login", action:{
                         viewModel.LogIn(email: viewModel.email, password: viewModel.password, complited: (User?) -> Void)
                         })
                         .foregroundColor(.white)
                         .frame(width: 100, height: 50)
                         .background(Color.blue)
                         .cornerRadius(10)
                         
                         }*/
                        HStack{
                            Text("New to NoteCar ?").font(.system(size: 15, design: .rounded)).foregroundColor(.gray)
                            
                            NavigationLink(destination:RegisterView()){
                                
                                
                                Text("Register")                .foregroundColor(.blue)
                                    .frame(width: 80, height: 40)
                                    
                                    .cornerRadius(10)
                                
                            }
                        }
                        }
                } .navigationBarHidden(true)
                
            }
            
        }
        
       
    }
struct LoginScreenView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginScreenView(isLogin: true)
                .previewInterfaceOrientation(.portrait)
        }
    }
}
