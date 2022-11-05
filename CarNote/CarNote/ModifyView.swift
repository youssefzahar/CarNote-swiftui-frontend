//
//  ModifyView.swift
//  CarNote
//
//  Created by Mac2021 on 5/11/2022.
//

import SwiftUI

struct ModifyView: View {
    
    @State private var firstName=""
    @State private var lastName=""
    @State private var cin=""
    @State private var phoneNumber=""
    @State private var email=""
    @State private var role=""
    
    var body: some View {
        NavigationView{
            ZStack{

                VStack{
                    Image("logo").resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100)
                    Text("Modify Profile").font(.largeTitle).bold().padding()
                    
                    TextField("First Name", text: $firstName)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                              
                    TextField("Last Name", text: $lastName)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                              
                    TextField("Cin", text: $cin)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    TextField("Phone Number", text: $phoneNumber)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    TextField("Email", text: $email)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    TextField("role", text: $role)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    Button("Upload image"){}
                        .foregroundColor(.blue)
                        .frame(width: 300, height: 50)
                        .background(Color.white)
                        .cornerRadius(10)
                    
                    Button("Save Profile"){}
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                    

                }
            }
        }
        .navigationBarHidden(true)
        
    }
}

struct ModifyView_Previews: PreviewProvider {
    static var previews: some View {
        ModifyView()
    }
}
