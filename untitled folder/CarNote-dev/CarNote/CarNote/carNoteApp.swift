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

    var body: some Scene {
        WindowGroup {
            ProductListUIView()
            //DateEntretienUIView()
            //HomeVendeur()
           // CarUIView()
          // LoginScreenView(isLogin:false)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
