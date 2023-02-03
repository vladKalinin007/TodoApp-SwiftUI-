//
//  TodoAppSwiftUIApp.swift
//  TodoAppSwiftUI
//
//  Created by Владислав Калинин on 11.11.2022.
//

import SwiftUI

@main
struct TodoAppSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(IconNames())
        }
    }
}
