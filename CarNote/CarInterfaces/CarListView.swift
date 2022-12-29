//
//  CarListView.swift
//  carNote
//
//  Created by Apple Esprit on 21/12/2022.
//

import SwiftUI

struct CarListView: View {
    var columns = [GridItem(.adaptive(minimum: 150), spacing: 30)]
    @StateObject var  carViewModel = CarViewModel()

    
    @State var cars : [Car] = []
    
    let mycars  : LocalizedStringKey = "My Cars"

    
    var body: some View {
        NavigationView{
          
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
                } .navigationTitle(Text(mycars))
            }
            .onAppear{
                carViewModel.GetCars() {success, result in
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
