//
//  ModifyUserView.swift
//  carNote
//
//  Created by youssef-mariem on 17/12/2022.
//

import SwiftUI

struct ModifyUserView: View {
    @State private var email=""
    @State private var phone_number=""
    //@Binding public var email :String
   // @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil

    @ObservedObject var viewModel = UserViewModel()
    
    ///traduction
    let modifyprof  : LocalizedStringKey = "Modify Your Profile !"
    let emailmod  : LocalizedStringKey = "Email"
    let num  : LocalizedStringKey = "Phone Number"
    let saveprof  : LocalizedStringKey = "Save Profile"
    
    var body: some View {
        NavigationView{
            ZStack{
                Text(modifyprof).font(.system(size: 50, design: .rounded)).bold().padding().foregroundColor(.blue).offset(x:0,y:-300)
                VStack  (alignment: .leading, spacing: 10){                    
                    VStack{
                        
                        Text(emailmod).font(.system(size: 20, design: .rounded)).bold().padding().foregroundColor(.blue).offset(x:-110)
                        
                        HStack{
                            Image(systemName: "person").foregroundColor(.blue)
                                .foregroundColor(.gray).font(.headline)
                            TextField(UserViewModel.currentUser?.email ?? "", text: $viewModel.email)
                                .padding()
                            .frame(width: 300, height: 30)}
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                    }
                    VStack{
                        Text(num).font(.system(size: 20, design: .rounded)).bold().padding().foregroundColor(.blue).offset(x:-70)
                        HStack{
                            Image(systemName: "phone").foregroundColor(.blue)
                                .foregroundColor(.gray).font(.headline)
                            TextField(UserViewModel.currentUser?.phone_number ?? "", text: $viewModel.phone_number)
                                .padding()
                            .frame(width: 300, height: 30)} .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                        
                    }
                    
                    
                        
                        HStack {
                            Spacer().frame(width: 30)

                          /*  NavigationLink(destination: UserProfileView()){
                                Text(saveprof).foregroundColor(.white)
                            }
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .simultaneousGesture(TapGesture().onEnded{
                                viewModel.UpdateUser(_id: UserViewModel.currentUser?._id ?? "", email: viewModel.email, phone_number: viewModel.phone_number)
                            })*/
                            
                            
                            Button(saveprof, action: {
                                viewModel.UpdateUser(_id: UserViewModel.currentUser?._id ?? "", email: viewModel.email, phone_number: viewModel.phone_number)
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

struct ModifyUserView_Previews: PreviewProvider {
    static var previews: some View {
        ModifyUserView()
    }
}
