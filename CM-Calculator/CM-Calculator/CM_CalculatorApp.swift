//
//  CM_CalculatorApp.swift
//  CM-Calculator
//
//  Created by Luiz Claudio Mattos da Silva on 29/01/24.
//

import SwiftUI

@main
struct CM_CalculatorApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
