//
//  CarUIView.swift
//  carNote
//
//  Created by youssef-mariem on 22/11/2022.
//

import SwiftUI

struct CarUIView: View {
    
    var body: some View {
            ZStack{
                Color.white

            VStack {
                HStack{
                    Spacer()
                    Image("logo").resizable().aspectRatio(contentMode: .fill).frame(width: 200, height: 200).clipShape(Circle()).clipped()
                    
                    Spacer()
                }
                      
                Text("Immatricule : 2tunis1").foregroundColor(.blue).font(.title).padding()
                Text("Marque : ford").foregroundColor(.blue).font(.title).padding()
                Text("Modele : x5").foregroundColor(.blue).font(.title).padding()
                Text("Type : Voiture").foregroundColor(.blue).font(.title).padding()
                Text("Puissance : 6 cheveaux").foregroundColor(.blue).font(.title).padding()
                Text("Carburant : Essence").foregroundColor(.blue).font(.title).padding()
                Text("Age : 1 ans").foregroundColor(.blue).font(.title).padding()

/*                NavigationLink(destination:ModifyView(){ Text("Modifier mon profil")
                    .foregroundColor(.blue)
                    .frame(width: 200, height: 50)
     
                }*/
                
                NavigationLink(destination:RegisterView()){
                Text("Modify")
                .foregroundColor(.white)
                .frame(width: 100, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                
            }


                       
                    


            }
            }
 
            
        }
}

struct CarUIView_Previews: PreviewProvider {
    static var previews: some View {
        CarUIView()
    }
}
