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
    
    
    let pickdate  : LocalizedStringKey = "Pick Date "
    let logout  : LocalizedStringKey = "Logout"
    let updateprof  : LocalizedStringKey = "Update Account"
    let changepass  : LocalizedStringKey = "Change Password"

    
    var body: some View {
        NavigationView{
            
            VStack{
                VStack{
                    
                    if role == "User" {
                        
                        NavigationLink(destination:DateEntretienUIView()) {
                            Text(pickdate)
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
                            Text(logout)
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
                
                
                NavigationLink(destination: ModifyUserView(), label: {Text(updateprof)})
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .font(.headline)
                    .cornerRadius(10)
                
                
                NavigationLink(destination: ChangePassword(), label: {Text(changepass)})
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .font(.headline)
                    .cornerRadius(10)
                
                
            }}.navigationBarHidden(false)
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
