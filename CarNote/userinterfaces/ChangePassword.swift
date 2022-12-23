//
//  ChangePassword.swift
//  carNote
//
//  Created by Apple Esprit on 23/12/2022.
//

import SwiftUI

struct ChangePassword: View {
    @State private var password=""
    @State private var confirmedPassword=""
    @ObservedObject var viewModel = UserViewModel()
    var body: some View {
        NavigationView{
            ZStack{
                Text(" Change Password ").font(.system(size: 50, design: .rounded)).bold().padding().foregroundColor(.blue).offset(x:0,y:-300)
                VStack  (alignment: .leading, spacing: 10){
                    
                    VStack {
                        Text(" New Password : ").font(.system(size: 20, design: .rounded)).bold().padding().foregroundColor(.blue).offset(x:-110)
                        HStack{
                            Image(systemName: "lock.doc").foregroundColor(.blue)
                                .foregroundColor(.gray).font(.headline)
                            
                            TextField("New Password", text: $viewModel.password)
                                .padding()
                            .frame(width: 300, height: 30)}
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                        
                    }
                    VStack {
                        Text(" Confirme New Password : ").font(.system(size: 20, design: .rounded)).bold().padding().foregroundColor(.blue).offset(x:-68)
                        HStack{
                            Image(systemName: "lock.doc.fill").foregroundColor(.blue)
                                .foregroundColor(.gray).font(.headline)
                            
                            TextField("Confirme New Password", text: $viewModel.confirmedPassword)
                                .padding()
                            .frame(width: 300, height: 30)}
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))

                    }
                        HStack {
                            Spacer().frame(width: 30)
                            Button("Save Profile", action:{
                                viewModel.ChangePassword(_id: UserViewModel.currentUser?._id ?? "", password: viewModel.password, confirmedPassword: viewModel.confirmedPassword)
                            })
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
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
