//
//  LoginScreenView.swift
//  CarNote
//
//  Created by Mac2021 on 5/11/2022.
//

import SwiftUI

struct LoginScreenView: View {
    @State private var username=""
    @State private var password=""
    @State private var wrongUsername=""

    var body: some View {
        NavigationView{
            ZStack{
                Color.blue.ignoresSafeArea()
                Circle().scale(1.7).foregroundColor(.white.opacity(0.15))
                Circle().scale(1.35).foregroundColor(.white)
                VStack{
                    Image("logo").resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100)
                        
                    Text("Login").font(.largeTitle).bold().padding()
                    TextField("User Name", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    TextField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    Button("Login"){}
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                    Text("Forgot Password")
                        .foregroundColor(.blue)
                        .frame(width: 300, height: 50)
                        .background(Color.white)
                        .cornerRadius(10)

                }
            }
        }
        .navigationBarHidden(true)
        
    }
    
}

struct LoginScreenView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginScreenView()
                .previewInterfaceOrientation(.portrait)
        }
    }
}
