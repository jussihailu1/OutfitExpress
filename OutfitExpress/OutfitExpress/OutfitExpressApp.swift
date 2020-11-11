//
//  OutfitExpressApp.swift
//  OutfitExpress
//
//  Created by Jussi Hailu on 11/11/2020.
//

import SwiftUI

@main
struct OutfitExpressApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
