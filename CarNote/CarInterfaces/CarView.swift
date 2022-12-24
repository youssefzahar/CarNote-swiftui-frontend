//
//  CarView.swift
//  carNote
//
//  Created by Apple Esprit on 21/12/2022.
//

import SwiftUI

struct CarView: View {
    var car : Car
    var body: some View
    {  ZStack(alignment: .topLeading){
        ZStack(alignment: .bottom){
            AsyncImage(url: URL(string: "http://172.17.1.91:3000/uploads/"+car.image!),
                                                                   content:{ image in
                                                            image
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 180)
                    .scaledToFit()
                                                            
                                                            
                                                            
                                                            
                                                        },placeholder: { })
            VStack(alignment: .leading){
                HStack{
                    Text("Modele: ")
                    Text(car.modele!)
                        .bold()
                }
                HStack{
                    Text("Marque: ")
                    Text(car.marque!).bold()

                }
                HStack{
                    Text("Type: ")
                    Text(car.type!).bold()

                }
                

              /*  Text("\(car.kilometrage!,format: .number)km")
                    .font(.caption)*/
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
