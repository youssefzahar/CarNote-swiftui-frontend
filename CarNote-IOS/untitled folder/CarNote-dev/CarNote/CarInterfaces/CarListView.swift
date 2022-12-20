//
//  CarListView.swift
//  carNote
//
//  Created by youssef-mariem on 17/12/2022.
//

import SwiftUI

struct CarListView: View {
    var columns = [GridItem(.adaptive(minimum: 150), spacing: 30)]
    @StateObject var  carViewModel = CarViewModel()

    
    @State var cars : [Car] = []
    
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns, spacing: 20){
                    ForEach(0 ..< cars.count, id:  \ .self ) {
                        index in CarView(car : cars[index])
                        
                    }
                }
                    .padding()
                }
               /* .navigationTitle(Text("Car Shop"))
                .toolbar{
                    NavigationLink{
                      CarView(car: Car)
                           
                    } label: {
                      //  CartButton(numberOfProducts: cartManager.ListCars.count)
                        
                    }
                }*/
            }
            .onAppear{
                carViewModel.GetCars {success, result in
                    if success {
                        self.cars = []
                        self.cars.append(contentsOf: result!)
                    }
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
        
    }

struct CarListView_Previews: PreviewProvider {
    static var previews: some View {
       // CarListView(car : ListCars[0])
        CarListView()
    }
}
