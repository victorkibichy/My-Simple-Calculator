//
//  My_Simple_CalculatorApp.swift
//  My Simple Calculator
//
//  Created by  Bouncy Baby on 6/4/24.
//

import SwiftUI

@main
struct My_Simple_CalculatorApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
