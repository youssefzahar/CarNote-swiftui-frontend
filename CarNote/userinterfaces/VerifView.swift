//
//  VerifView.swift
//  carNote
//
//  Created by youssef-mariem on 12/11/2022.
//

import SwiftUI

struct VerifView: View {
    @State private var email=""
    @State private var emailToken=""
@ObservedObject var viewModel = UserViewModel()
    var body: some View {
        ZStack{
            Color.white
            Color.blue.ignoresSafeArea()
            Circle().scale(1.7).foregroundColor(.white.opacity(0.15))
            Circle().scale(1.50).foregroundColor(.white)
            
        VStack {
            
            Text("Verification").font(.system(size: 50, design: .rounded)).bold().padding().foregroundColor(.blue).offset(x:0,y:-50)
            
            
            HStack{
                
                Text("Enter the verification code we just send you on your email address .").font(.system(size: 20, design: .rounded)).bold().padding().foregroundColor(.gray).offset(x:0,y:-50)

                
            }
            
            
            /*HStack{
                
                Spacer()
                Image("logo").resizable().aspectRatio(contentMode: .fill).frame(width: 200, height: 200).clipShape(Circle()).clipped().padding(.all)
                Spacer()
   
            }*/
           
            HStack{
                Image(systemName: "envelope").foregroundColor(.blue)
                    .foregroundColor(.gray).font(.headline)
                TextField("Enter you email address", text: $viewModel.email)
                    .padding()
                    .frame(width: 300, height: 30)}
            .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
         
            
          
            HStack{
                
               
                
                
                NavigationLink(destination:LoginScreenView(isLogin:true)){
                    Button("Verify", action:{
                        viewModel.VerifyAccount(emailToken: viewModel.emailToken)
                    })
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .offset(x:0,y: 50)
                }
        }
        }
        }  .navigationBarHidden(true)
    }
}


struct VerifView_Previews: PreviewProvider {
    static var previews: some View {
        VerifView()
    }
}
