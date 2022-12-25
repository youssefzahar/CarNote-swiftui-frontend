//
//  EntretienUIView.swift
//  carNote
//
//  Created by Apple Esprit on 24/12/2022.
//

import SwiftUI

struct EntretienUIView: View {
    @State private var isActive: Bool = false
  
    var entretien: Entretien
   

    var body: some View {
        ZStack(alignment: .topLeading){
            
            
            

          
            ZStack(alignment: .bottom){
                Image("P4")
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 180)
                    .scaledToFit()
                VStack(alignment: .leading){
                    Text(entretien.title)
                        .bold()
                    Text("Your entretien Date is \(entretien.date!)")
                    
                
                    
                }
                .padding()
                .frame(width: 180 , alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            }
            .frame(width: 180, height: 250)
            .shadow(radius: 3)        }

    }
}

struct EntretienUIView_Previews: PreviewProvider {
    static var previews: some View {
        EntretienUIView(entretien: entretienList[0])
    }
}
