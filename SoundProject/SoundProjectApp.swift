//
//  SoundProjectApp.swift
//  SoundProject
//
//  Created by Mijael Cama on 17/06/22.
//

import SwiftUI

@main
struct SoundProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
