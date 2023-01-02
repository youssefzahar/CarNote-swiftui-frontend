//
//  CarView.swift
//  carNote
//
//  Created by Apple Esprit on 21/12/2022.
//

import SwiftUI

struct CarView: View {
    var car : Car
    
    let Modele  : LocalizedStringKey = "Model  : "
    let CarType  : LocalizedStringKey = "Type : "
    let Marque  : LocalizedStringKey = "Brand: "
    
    
    
    var body: some View
    {  ZStack(alignment: .topLeading){
        ZStack(alignment: .bottom){
            AsyncImage(url: URL(string: "http://172.17.0.156:3000/uploads/"+car.image!),
                                                                   content:{ image in
                                                            image
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 180)
                    .scaledToFit()
                                                            
                                                            
                                                            
                                                            
                                                        },placeholder: { })
            VStack(alignment: .leading){
                HStack{
                    Text(Modele)
                    Text(car.modele!)
                        .bold()
                }
                HStack{
                    Text(Marque)
                    Text(car.marque!).bold()

                }
                HStack{
                    Text(CarType)
                    Text(car.type!).bold()

                }

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
