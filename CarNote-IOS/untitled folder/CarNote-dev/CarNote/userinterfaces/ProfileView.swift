//
//  ProfileView.swift
//  carNote
//
//  Created by youssef-mariem on 12/11/2022.
//

import SwiftUI

struct ProfileView: View {
   // @Binding public var email :String
    @ObservedObject var viewModel = UserViewModel()
    //@State var first_name:String = UserViewModel.currentUser?.first_name ?? ""


    var body: some View {
            ZStack{
                Color.white

            VStack {
                HStack{
                    Spacer()
                    Image("logo").resizable().aspectRatio(contentMode: .fill).frame(width: 200, height: 200).clipShape(Circle()).clipped()
                    
                    Spacer()
                }
         
                HStack{
                    Spacer()
                    Text(viewModel.first_name).foregroundColor(.blue).font(.title).padding()
                    Text("").foregroundColor(.blue).font(.title).padding()
                    Spacer()
                }

                
                NavigationLink(destination:ModifyView(/*email:$email*/)){
                    Text("Modifier mon profil")                        .foregroundColor(.white)
                        .frame(width: 100, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                       
                    }
                
              
                
                 Button("Delete", action:{
                    viewModel.DeleteUser(email: viewModel.email)
                })
                        .foregroundColor(.white)
                        .frame(width: 100, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                       
                    


            }
            }
            .navigationBarHidden(true)
            .onAppear(){
                let user = viewModel

            }
            
        }
    }

   /* struct ProfileView_Previews: PreviewProvider {
      /*  static var previews: some View {
            ProfileView()
        }*/
    }*/

