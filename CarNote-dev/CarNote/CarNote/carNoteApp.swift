//
//  carNoteApp.swift
//  carNote
//
//  Created by youssef-mariem on 12/11/2022.
//

import SwiftUI

@main
struct carNoteApp: App {
    let persistenceController = PersistenceController.shared

    
    init() {
            StripeAPI.defaultPublishableKey = "pk_test_51MDmEvEbHfjP9Lzb64xZtPXhS148ipevmk5oNCa4r8y8R5TaNuNKF3DEQkmfg8Axp52sqPQXceD8E8Rtt0czn4HB00XJQohZMm"
        }
    
    var body: some Scene {
        WindowGroup {
            
            ProductListUIView()
            //HomeVendeur()
           // CarUIView()
           //LoginScreenView(isLogin:false)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
