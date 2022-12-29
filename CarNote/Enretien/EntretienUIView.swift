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
                
                VStack(alignment: .leading){
                    Text(entretien.title)
                        .bold().foregroundColor(.blue)
                  //  Text("Your entretien Date is \(entretien.date!)")
                    Text("Your entretien Date is \(Date.now)")

                
                    
                }
                .padding()
                .frame(width: 280 , alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            }
            .frame(width: 280, height: 250)
            .shadow(radius: 3)        }

    }
}

struct EntretienUIView_Previews: PreviewProvider {
    static var previews: some View {
        EntretienUIView(entretien: entretienList[0])
    }
}
