//
//  carNoteApp.swift
//  carNote
//
//  Created by youssef-mariem on 12/11/2022.
//

import SwiftUI
import Stripe

@main
struct carNoteApp: App {
    
    init(){
        StripeAPI.defaultPublishableKey = "pk_test_51MDmEvEbHfjP9Lzb64xZtPXhS148ipevmk5oNCa4r8y8R5TaNuNKF3DEQkmfg8Axp52sqPQXceD8E8Rtt0czn4HB00XJQohZMm"
    }
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            AddCarUIView()
           // ProductListUIView()
            //DateEntretienUIView()
            //HomeVendeur()
           // CarUIView()
         // LoginScreenView(isLogin:false)
           // ModifyView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
