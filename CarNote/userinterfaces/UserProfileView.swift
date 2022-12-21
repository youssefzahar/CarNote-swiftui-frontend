//
//  UserProfileView.swift
//  carNote
//
//  Created by youssef-mariem on 21/11/2022.
//

import SwiftUI

struct UserProfileView: View {
    @State private var isShowingAlert = false
    
    @ObservedObject var viewModel = UserViewModel()
    @State var first_name:String = UserViewModel.currentUser?.first_name ?? ""
    @State var  last_name:String = UserViewModel.currentUser?.last_name ?? ""
    @State var  email:String = UserViewModel.currentUser?.email ?? ""
    @State var  phone_number:String = UserViewModel.currentUser?.phone_number ?? ""
    @State var  role:String = UserViewModel.currentUser?.role ?? ""
    @State var  _id:String = UserViewModel.currentUser?._id ?? ""



    
    
    
    var body: some View {
        NavigationView{
            
            VStack{
                VStack{
                    
                    if role == "User" {
                        
                        NavigationLink(destination:DateEntretienUIView()) {
                            Text("Pick Date ")
                        }      .foregroundColor(.blue)
                            .frame(width: 100, height: 50)
                            .background(Color.white)
                            .cornerRadius(10)
                            .offset(x:150,y: -50)
                        Image(systemName: "calendar.badge.plus")
                            .foregroundColor(.blue)
                            .offset(x:80,y:-85)
                    }
                    
                    
                    
                    
                    HStack{
                        NavigationLink(destination:LoginScreenView(isLogin: true)){
                            Text("Logout")
                            .foregroundColor(.blue)
                            .frame(width: 200, height: 50)
             
                        }
                    }
                    
                    Image("logo")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                    
                    
                    Text(first_name)
                        .font(.title)
                        .bold()
                    
                    
                    Text(last_name)
                        .font(.title)
                        .bold()
                }
                
                Spacer().frame(height: 30)
                
                VStack(alignment: .leading, spacing: 12){
                    
                    
                    
                    HStack{
                        Image(systemName: "envelope")
                        Text(email)
                    }
                    
                    HStack{
                        Image(systemName: "phone")
                        Text(phone_number)
                        
                    }
                    
                    Text("id :")
                    Text(_id)
                        .font(.title)
                        .bold()
                    
                }
                Spacer().frame(height: 150)
                
                
                NavigationLink(destination:ModifyUserView()){ Button("Update profile", action:{
                })
                .bold()
                .frame(width: 120, height: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(12)
                    
                }
                
                
                Button{
                    isShowingAlert = true
                }label: {
                    Text("Delete")
                        .bold()
                        .frame(width:120, height: 50)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .alert("Are you Sure ?", isPresented: $isShowingAlert){
                            Button("Delete",role: .destructive){
                                print("Profile Deleted")}
                        }
                }
                
                
            }}.navigationBarHidden(true)
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
