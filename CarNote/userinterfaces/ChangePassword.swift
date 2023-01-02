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
    
    ///traduction
    let changepassword  : LocalizedStringKey = " Change Password "
    let newpassword  : LocalizedStringKey = " New Password : "
    let confirm  : LocalizedStringKey = " Confirme New Password : "
    let saveprof  : LocalizedStringKey = "Save Profile"

    
    
    var body: some View {
        NavigationView{
            ZStack{
                Text(changepassword).font(.system(size: 50, design: .rounded)).bold().padding().foregroundColor(.blue).offset(x:0,y:-300)
                VStack  (alignment: .leading, spacing: 10){
                    
                    VStack {
                        Text(newpassword).font(.system(size: 20, design: .rounded)).bold().padding().foregroundColor(.blue).offset(x:-110)
                        HStack{
                            Image(systemName: "lock.doc").foregroundColor(.blue)
                                .foregroundColor(.gray).font(.headline)
                            
                            TextField(newpassword, text: $viewModel.password)
                                .padding()
                            .frame(width: 300, height: 30)}
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                        
                    }
                    VStack {
                        Text(confirm).font(.system(size: 20, design: .rounded)).bold().padding().foregroundColor(.blue).offset(x:-68)
                        HStack{
                            Image(systemName: "lock.doc.fill").foregroundColor(.blue)
                                .foregroundColor(.gray).font(.headline)
                            
                            TextField(confirm, text: $viewModel.confirmedPassword)
                                .padding()
                            .frame(width: 300, height: 30)}
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))

                    }
                        HStack {
                           /* NavigationLink(destination: UserProfileView()){
                                Text(saveprof).foregroundColor(.white)
                            }
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .simultaneousGesture(TapGesture().onEnded{
                                viewModel.ChangePassword(_id: UserViewModel.currentUser?._id ?? "", password: viewModel.password, confirmedPassword: viewModel.confirmedPassword)
                            })*/
                            
                            Button(saveprof, action: {
                                viewModel.ChangePassword(_id: UserViewModel.currentUser?._id ?? "", password: viewModel.password, confirmedPassword: viewModel.confirmedPassword)
                            }
                                     
                                   
                            )
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                        }
                }
            }
        }
        .navigationBarHidden(false)
        
    }
}

struct ChangePassword_Previews: PreviewProvider {
    static var previews: some View {
        ChangePassword()
    }
}
