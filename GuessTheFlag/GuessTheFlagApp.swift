//
//  GuessTheFlagApp.swift
//  GuessTheFlag
//
//  Created by Ahmet Kaan Kara on 29.04.2022.
//

import SwiftUI

@main
struct GuessTheFlagApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
