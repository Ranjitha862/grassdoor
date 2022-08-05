//
//  iOS_GrassdoorApp.swift
//  iOS_Grassdoor
//
//  Created by Ranjitha S on 02/08/22.
//

import SwiftUI

@main
struct iOS_GrassdoorApp: App {
    let persistenceController = PersistenceController.shared
    var selectedTab: Int = 0

    var body: some Scene {
        WindowGroup {
            TabsView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
