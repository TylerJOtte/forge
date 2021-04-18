//
//  SimulationApp.swift
//  Simulation
//
//  Created by Tyler J. Otte on 4/18/21.
//

import SwiftUI
import Forge

@main
struct SimulationApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
