//
//  VerifView.swift
//  carNote
//
//  Created by youssef-mariem on 12/11/2022.
//

import SwiftUI

struct VerifView: View {
    @State private var emailToken=""
@ObservedObject var viewModel = UserViewModel()
    
    
    let verif : LocalizedStringKey = "Verification"
    let code : LocalizedStringKey = "Enter the verification code we just send you on your email address ."
    let enter : LocalizedStringKey = "Enter your code"
    let Verify : LocalizedStringKey = "Verify"

    var body: some View {
        ZStack{
            Color.white
            Color.blue.ignoresSafeArea()
            Circle().scale(1.7).foregroundColor(.white.opacity(0.15))
            Circle().scale(1.50).foregroundColor(.white)
            
        VStack {
            
            Text(verif).font(.system(size: 50, design: .rounded)).bold().padding().foregroundColor(.blue).offset(x:0,y:-50)
            
            
            HStack{
                
                Text(code).font(.system(size: 20, design: .rounded)).bold().padding().foregroundColor(.gray).offset(x:0,y:-50)

                
            }
           
            HStack{
                Image(systemName: "envelope").foregroundColor(.blue)
                    .foregroundColor(.gray).font(.headline)
                TextField(enter, text: $viewModel.emailToken)
                    .padding()
                    .frame(width: 300, height: 30)}
            .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
         
            
          
            HStack{

                NavigationLink(destination: LoginScreenView(isLogin:false)){
                    Text(Verify).foregroundColor(.white)
                }
                .foregroundColor(.white)
                .frame(width: 250, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                .simultaneousGesture(TapGesture().onEnded{
                    viewModel.VerifyAccount(emailToken: viewModel.emailToken)
                })
        }
        }
        }
    }
}


struct VerifView_Previews: PreviewProvider {
    static var previews: some View {
        VerifView()
    }
}
