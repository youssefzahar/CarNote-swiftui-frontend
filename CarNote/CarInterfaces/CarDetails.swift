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
    
    let CarType  : LocalizedStringKey = "Type : "
    let Chevaux  : LocalizedStringKey = "Horse Power"
    let Puissance  : LocalizedStringKey = "Horse Power : "
    let Fuel  : LocalizedStringKey = "Fuel : "
    let Description  : LocalizedStringKey = "Description : "
    let Features  : LocalizedStringKey = "Features"
    let Delete  : LocalizedStringKey = "Delete"
    let sale  : LocalizedStringKey = "Put For Sale"


    var body: some View {
        
        VStack (alignment: .leading) {
            
            AsyncImage(url: URL(string: "http://172.17.1.75:3000/uploads/"+car.image!),
                                                                   content:{ image in
                                                            image
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 180)
                    .scaledToFit()
                                                            
                                                            
                                                            
                                                            
                                                        },placeholder: { })
            
            
            HStack{
                Text(car.marque!)
                    .font(.title)
                    .fontWeight(.bold)
                Text(car.modele!)
                    .font(.title)
                    .fontWeight(.bold)
            }
            
            //                Rating
            
            Text(Description)
                .fontWeight(.medium)
                .padding(.vertical, 8)
            Text(car.description!)
                .lineSpacing(8.0)
                .opacity(0.6)
            
            //                Info
            HStack (alignment: .top) {
                VStack (alignment: .leading) {
                    Text(Features)
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    HStack{
                        Text(CarType)
                            .opacity(0.6)
                        Text(car.type!)
                            .opacity(0.6)
                    }
                    HStack{
                        Text(Puissance)
                            .opacity(0.6)
                        HStack{
                            Text("\(car.puissance!,format: .number)").opacity(0.6)
                            Text(Chevaux).opacity(0.6)
                        }
                    }
                    HStack{
                        Text(Fuel)
                            .opacity(0.6)
                        Text(car.carburant!)
                            .opacity(0.6)
                    }
                    Spacer().frame(width: 30)
                    if car.owned_by! == UserViewModel.currentUser?._id ?? ""

                                        {
                                            NavigationLink(destination: CarListView()){
                                                Text(Delete).foregroundColor(.red)
                                            }.simultaneousGesture(TapGesture().onEnded{
                                                viewModel.DeleteCar(_id: car._id!)
                                            })
                                            
                                            NavigationLink(destination: CarListView()){
                                                Text(sale).foregroundColor(.green)
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
