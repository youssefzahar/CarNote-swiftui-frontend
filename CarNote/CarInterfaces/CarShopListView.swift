//
//  CarShopListView.swift
//  carNote
//
//  Created by Apple Esprit on 21/12/2022.
//

import SwiftUI



struct CarShopListView: View {
    var columns = [GridItem(.adaptive(minimum: 150), spacing: 30)]
    @StateObject var  carViewModel = CarViewModel()

    
    @State var cars : [Car] = []
    let forSale  : LocalizedStringKey = "Cars For Sale"

    
    var body: some View {
        NavigationView{
        Text("")
            ScrollView{
                LazyVGrid(columns: columns, spacing: 20){
                    ForEach(0 ..< cars.count, id:  \ .self ) {
                        index in
                        NavigationLink(destination: CarDetails(car : cars[index])){
                            CarView(car : cars[index])

                        }

                        
                    }
                }
                    .padding()
            } .navigationTitle(Text(forSale).foregroundColor(.blue))
                .navigationTitle(Text("Car Shop"))
                /*.toolbar{
                    NavigationLink{
                      CarView(car: Car)
                           
                    } label: {
                      //  CartButton(numberOfProducts: cartManager.ListCars.count)
                        
                    }
                }*/
            }.navigationBarHidden(false)
            .onAppear{
                carViewModel.GetPublicCars() {success, result in
                    if success {
                        self.cars = []
                        self.cars.append(contentsOf: result!)
                    }
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
        
    }

struct CarShopListView_Previews: PreviewProvider {
    static var previews: some View {
       // CarListView(car : ListCars[0])
        CarShopListView()
    }
}
