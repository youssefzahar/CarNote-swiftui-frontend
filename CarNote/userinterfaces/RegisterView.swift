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

    
    //translation
    let username : LocalizedStringKey = "User Name"
    let first : LocalizedStringKey = "First Name"
    let last : LocalizedStringKey = "Last Name"
    let register : LocalizedStringKey = "Register"
    let emailreg : LocalizedStringKey = "Email"
    let pass : LocalizedStringKey = "Password"
    let num : LocalizedStringKey = "Phone Number"
    let rolereg : LocalizedStringKey = "Role"
    let part : LocalizedStringKey = "By making an Account you accept the"
    let part2 : LocalizedStringKey = " Terms And Conditions Of Usage"


    
    
        var body: some View {
           // NavigationView{
                ZStack{
                    ScrollView{
                    VStack  (alignment: .leading, spacing: 30){
                        /*  Image("logo").resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100).clipShape(Circle()).padding()*/
                        
                        Text(register).font(.system(size: 50, design: .rounded)).bold().padding().foregroundColor(.blue).offset(x:0,y:0)
                        
                        
                            
                            HStack{
                                Image(systemName: "person").foregroundColor(.blue)
                                    .foregroundColor(.gray).font(.headline)
                                TextField(first, text: $viewModel.first_name)
                                    .padding()
                                .frame(width: 300, height: 30)}
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                            
                            
                            HStack{
                                Image(systemName: "person").foregroundColor(.blue)
                                    .foregroundColor(.gray).font(.headline)
                                
                                TextField(last, text: $viewModel.last_name)
                                    .padding()
                                .frame(width: 300, height: 30)}
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                            
                            HStack{
                                Image(systemName: "person").foregroundColor(.blue)
                                    .foregroundColor(.gray).font(.headline)
                                TextField(username, text: $viewModel.user_name)
                                    .padding()
                                .frame(width: 300, height: 30)}
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                            HStack{
                                Image(systemName: "envelope").foregroundColor(.blue)
                                    .foregroundColor(.gray).font(.headline)
                                TextField(emailreg, text: $viewModel.email)
                                    .padding()
                                .frame(width: 300, height: 30)}
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                            
                            HStack{
                                Image(systemName: "lock.circle").foregroundColor(.blue)
                                    .foregroundColor(.gray).font(.headline)
                                SecureField(pass, text: $viewModel.password)
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
                                TextField(num, text: $viewModel.phone_number)
                                    .padding()
                                .frame(width: 300, height: 30)} .padding()
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                            
                            HStack{
                                Image(systemName: "person").foregroundColor(.blue)
                                    .foregroundColor(.gray).font(.headline)
                                
                                
                                Picker(rolereg, selection: $role) {
                                                ForEach(roles, id: \.self) {
                                                    Text($0)
                                                }
                                            }
                               /* TextField("role", text: $viewModel.role)
                                    .padding()*/
                                .frame(width: 300, height: 30)}
                            .padding()
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                            
                            
                            
                            
                            VStack {
                                Text(part)
                                NavigationLink(destination:TermsWebView()){
                                    
                                    
                                    Text(part2)
                                        .foregroundColor(.blue)
                                        .cornerRadius(10)
                                    //.offset(x:-80,y:)
                                    
                                }
                            }
                            
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
