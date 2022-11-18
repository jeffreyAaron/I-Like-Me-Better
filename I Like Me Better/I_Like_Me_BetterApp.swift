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
    
    @Environment(\.managedObjectContext) var managedObjectContext

    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            QuoteView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
            
//            ImageSlider(
//                image_urls: ["https://cdn.discordapp.com/attachments/787088938933157952/1019865527402889266/DC2_6554.jpg", "https://cdn.discordapp.com/attachments/889229310131589150/1015820393401036870/IMG_20220128_090940627.jpg"],
//                image_titles: ["The Best Members of App Dev Team and Me", "Jack and Me"])
        }
    }
}
