//
//  VerifView.swift
//  CarNote
//
//  Created by youssef-mariem on 8/11/2022.
//

import SwiftUI

struct VerifView: View { @State private var email=""
    
    var body: some View {
        ZStack{
            Color.white
            Color.blue.ignoresSafeArea()
            Circle().scale(1.7).foregroundColor(.white.opacity(0.15))
            Circle().scale(1.50).foregroundColor(.white)

        VStack {
            
            HStack{
                
                Spacer()
                Image("logo").resizable().aspectRatio(contentMode: .fill).frame(width: 200, height: 200).clipShape(Circle()).clipped().padding(.all)
                Spacer()
           
                
               
            }
           
            HStack{
                
              
                TextField("email", text: $email)
                    .padding(.all)
                    .frame(width: 30, height: 50)
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(10)
                
                TextField("email", text: $email)
                    .padding(.all)
                    .frame(width: 30, height: 50)
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(10)
                
                
                TextField("email", text: $email)
                    .padding(.all)
                    .frame(width: 30, height: 50)
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(10)
                
                TextField("email", text: $email)
                    .padding(.all)
                    .frame(width: 30, height: 50)
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(10)
                
               
            }
          
            HStack{
                
                Text("Submit")
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)

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
