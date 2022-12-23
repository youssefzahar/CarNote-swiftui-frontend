//
//  CarDetails.swift
//  carNote
//
//  Created by Apple Esprit on 23/12/2022.
//

import SwiftUI

struct CarDetails: View {
    var car: Car
    @ObservedObject var viewModel = CarViewModel()
    var body: some View {
           ZStack(alignment: .topLeading){
            ZStack(alignment: .bottom){
                Image("P4")
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 180)
                    .scaledToFit()
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
                    
                    HStack{
                        Text("Imatricule: ")
                        Text(car.immatricule).bold()

                    }
                    HStack{
                        Text("Puissance: ")
                        Text("\(car.puissance!,format: .number) Chevaux").bold()

                    }
                    HStack{
                        Text("Carburant: ")
                        Text(car.carburant!).bold()

                    }
                    HStack{
                        Text("Owner: ")
                        Text(car.owned_by!).bold()

                    }
                    HStack{
                        Text("Description: ")
                        Text(car.description!).bold()

                    }
    
                    
                    if car.owned_by! == UserViewModel.currentUser?._id ?? ""

                    {
                        NavigationLink(destination: CarListView()){
                            Text("Delete").foregroundColor(.red)
                        }.simultaneousGesture(TapGesture().onEnded{
                            viewModel.DeleteCar(_id: car._id!)
                        })
                        
                        NavigationLink(destination: CarListView()){
                            Text("Put For Sale").foregroundColor(.green)
                        }.simultaneousGesture(TapGesture().onEnded{
                            viewModel.MakeCarPublic(_id: car._id!)
                        })
                        
                    }
                    
                    
                }
                .padding()
                .frame(width: 180 , alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            }
            .frame(width: 180, height: 250)
            .shadow(radius: 3)
            
        }}
}

struct CarDetails_Previews: PreviewProvider {
    static var previews: some View {
        CarDetails(car: carList[0])
    }
}
