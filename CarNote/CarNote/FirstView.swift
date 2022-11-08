//
//  FirstView.swift
//  CarNote
//
//  Created by youssef-mariem on 8/11/2022.
//

import SwiftUI

struct FirstView: View {

    var body: some View {
        NavigationView{
            ZStack{
                Color.blue.ignoresSafeArea()
                Circle().scale(1.7).foregroundColor(.white.opacity(0.15))
                Circle().scale(1.50).foregroundColor(.white)
                VStack{
                    
                    Image("logo").resizable().aspectRatio(contentMode: .fit).frame(width: 200, height: 200).clipShape(Circle()).padding(.bottom)
                        
                
                   
                   
                    NavigationLink(destination:LoginScreenView()){ Text("Login")
                        .foregroundColor(.white)
                        .frame(width: 100, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                
                        
                   NavigationLink(destination:RegisterView()){
                    Text("Regitre")
                        .foregroundColor(.white)
                        .frame(width: 100, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        
                    }
                    }
                }
            }
        }
        .navigationBarHidden(true)
        
    }
    
}
struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
