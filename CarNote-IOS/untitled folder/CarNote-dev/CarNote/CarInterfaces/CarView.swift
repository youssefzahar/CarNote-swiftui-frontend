//
//  CarView.swift
//  carNote
//
//  Created by youssef-mariem on 17/12/2022.
//

import SwiftUI

struct CarView: View {
    var car : Car
    var body: some View
    {  ZStack(alignment: .topLeading){
        ZStack(alignment: .bottom){
            Image("P4")
                .resizable()
                .cornerRadius(20)
                .frame(width: 180)
                .scaledToFit()
            VStack(alignment: .leading){
                Text(car.immatricule)
                    .bold()
                Text("\(car.kilometrage!,format: .number)km")
                    .font(.caption)
            }
            .padding()
            .frame(width: 180 , alignment: .leading)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
        }
        .frame(width: 180, height: 250)
        .shadow(radius: 3)
        
       
        
        
       

        
    }}}
struct CarView_Previews: PreviewProvider {
    static var previews: some View {
        CarView(car: carList[0])
    }
}
