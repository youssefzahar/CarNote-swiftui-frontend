//
//  ForgotPasswordView.swift
//  carNote
//
//  Created by youssef-mariem on 12/11/2022.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email=""
    @ObservedObject var viewModel = UserViewModel()
        
    
    let forgot : LocalizedStringKey = "Forgot Password ?"
    let accountmail : LocalizedStringKey = "Enter the email address associated  with your account ."
    let mailaddresse : LocalizedStringKey = "Enter you email address"
    let submit : LocalizedStringKey = "Submit"
    
        var body: some View {
            ZStack{
                Color.white
                Color.blue.ignoresSafeArea()
                Circle().scale(1.7).foregroundColor(.white.opacity(0.15))
                Circle().scale(1.50).foregroundColor(.white)

            VStack {
                
                Text(forgot).font(.system(size: 50, design: .rounded)).bold().padding().foregroundColor(.blue).offset(x:0,y:-50)
                
             /*   HStack{
                    
                    Spacer()
                    Image("logo").resizable().aspectRatio(contentMode: .fill).frame(width: 100, height: 100).clipShape(Circle()).clipped().padding(.all)
                        .offset(x:0,y:-60)
    
                    Spacer()
               
                    
                   
                }*/
                
                HStack{
                    
                    Text(accountmail).font(.system(size: 20, design: .rounded)).bold().padding().foregroundColor(.gray).offset(x:0,y:-50)

                    
                }
                
                
                HStack{
                    Image(systemName: "envelope").foregroundColor(.blue)
                        .foregroundColor(.gray).font(.headline)
                    TextField(mailaddresse, text: $viewModel.email)
                        .padding()
                        .frame(width: 300, height: 30)}
                .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
             
                
                HStack{
                    
                    NavigationLink(destination: LoginScreenView(isLogin:false)){
                        Text(submit).foregroundColor(.white)
                    }
                    .foregroundColor(.white)
                    .frame(width: 250, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .simultaneousGesture(TapGesture().onEnded{
                        viewModel.ResetPassword(email: viewModel.email)
                    })
                        

            }
            }
            }
        }
    }


    struct ForgotPasswordView_Previews: PreviewProvider {
        static var previews: some View {
            ForgotPasswordView()
        }
    }
