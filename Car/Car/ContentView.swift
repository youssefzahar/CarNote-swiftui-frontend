//
//  ContentView.swift
//  Car
//
//  Created by youssef-mariem on 3/12/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        ProductsView()
    }


}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
