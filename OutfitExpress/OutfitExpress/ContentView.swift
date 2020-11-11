//
//  ContentView.swift
//  OutfitExpress
//
//  Created by Jussi Hailu on 11/11/2020.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        HomeView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
