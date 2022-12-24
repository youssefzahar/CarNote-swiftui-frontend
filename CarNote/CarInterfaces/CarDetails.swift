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
        
        VStack (alignment: .leading) {
            
            Image("logo")
                .resizable()
                .aspectRatio(1,contentMode: .fit)
                .edgesIgnoringSafeArea(.top)
            
            
            HStack{
                Text(car.marque!)
                    .font(.title)
                    .fontWeight(.bold)
                Text(car.modele!)
                    .font(.title)
                    .fontWeight(.bold)
            }
            
            //                Rating
            
            Text("Description :")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            Text(car.description!)
                .lineSpacing(8.0)
                .opacity(0.6)
            
            //                Info
            HStack (alignment: .top) {
                VStack (alignment: .leading) {
                    Text("Specifications")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    HStack{
                        Text("Type :")
                            .opacity(0.6)
                        Text(car.type!)
                            .opacity(0.6)
                    }
                    HStack{
                        Text("Puissance :")
                            .opacity(0.6)
                        Text("\(car.puissance!,format: .number) Chevaux").opacity(0.6)
                    }
                    HStack{
                        Text("Carburant :")
                            .opacity(0.6)
                        Text(car.carburant!)
                            .opacity(0.6)
                    }
                    Spacer().frame(width: 30)
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
                
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical)
        }
        .padding()
        .padding(.top)
        .background(Color("Bg"))
        .cornerRadius(30, corners: [.topLeft, .topRight])
        .offset(x: 0, y: -30.0)
    }
}

struct CarDetails_Previews: PreviewProvider {
    static var previews: some View {
        CarDetails(car: carList[0])
    }
}
