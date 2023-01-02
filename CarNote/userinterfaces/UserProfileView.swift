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
    @State var  user_name:String = UserViewModel.currentUser?.user_name ?? ""
    
    var body: some View {
        NavigationView{
            
            VStack{
                VStack{
                    
                    if role == "User" {
                        
                        NavigationLink(destination:DateEntretienUIView()) {
                            Text("Pick Date ")
                        }      .foregroundColor(.blue)
                            .frame(width: 100, height: 50)
                            .cornerRadius(10)
                            .offset(x:150,y: -50)
                        Image(systemName: "calendar.badge.plus")
                            .foregroundColor(.blue)
                            .offset(x:80,y:-85)
                    }
                    
                    
                    
                    
                    HStack{
                        NavigationLink(destination:LoginScreenView(isLogin: false)){
                            Text("Logout")
                            .foregroundColor(.blue)
                            .frame(width: 200, height: 50)
             
                        }
                    }

                    
                    Image("logo")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                    
                    HStack{
                        Image(systemName: "persone")
                        Text(user_name)
                            .font(.title)
                            .bold()
                    }
                    
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

                    
                }
                
                
                NavigationLink(destination: ModifyUserView(), label: {Text("Update Account")})
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .font(.headline)
                    .cornerRadius(10)
                
                
                NavigationLink(destination: ChangePassword(), label: {Text("Change Password")})
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .font(.headline)
                    .cornerRadius(10)
 
                
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
                
                
            }}.navigationBarHidden(false)
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
