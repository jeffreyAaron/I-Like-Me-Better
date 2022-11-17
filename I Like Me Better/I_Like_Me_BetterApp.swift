//
//  I_Like_Me_BetterApp.swift
//  I Like Me Better
//
//  Created by Jeffrey on 11/16/22.
//

import SwiftUI

@main
struct I_Like_Me_BetterApp: App {
    
    @StateObject private var dataController = DataController()
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            QuoteView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
