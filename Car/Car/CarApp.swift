//
//  CarApp.swift
//  Car
//
//  Created by youssef-mariem on 3/12/2022.
//

import SwiftUI

@main
struct CarApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ProductViewModel())
        }
    }
}
