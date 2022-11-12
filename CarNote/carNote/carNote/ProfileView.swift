//
//  ProfileView.swift
//  carNote
//
//  Created by youssef-mariem on 12/11/2022.
//

import SwiftUI

struct ProfileView: View {
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
                    Text("Foulen").foregroundColor(.blue).font(.title).padding()
                    Text("Ben foulen").foregroundColor(.blue).font(.title).padding()
                    Spacer()
                }
             
                Text("+216 12345678").foregroundColor(.blue).font(.title).padding()
                Text("foulenbenfoulen.com").foregroundColor(.blue).font(.title).padding()
                
                NavigationLink(destination:ModifyView()){ Text("Modifier mon profil")
                    .foregroundColor(.blue)
                    .frame(width: 200, height: 50)
     
                }

            }
            }
            .navigationBarHidden(true)
            
        }
    }

    struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView()
        }
    }
