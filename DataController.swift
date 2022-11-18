//
//  DataController.swift
//  I Like Me Better
//
//  Created by Jeffrey on 11/16/22.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "lauvData")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
            
            let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Quote")
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

            do {
                try self.container.viewContext.execute(deleteRequest)
            } catch let error as NSError {
                // TODO: handle the error
            }
            
            
            let quote = Quote(context: self.container.viewContext)
            quote.title = "Breathe"
            quote.text = "I've watched those eyes light up with a smile."
            quote.albumCoverUrl = "https://i.scdn.co/image/ab67616d00001e02bdea30b86b37142ec99deb78"
            quote.id = UUID()
            
            // quote.albumCoverUrl = "https://i.scdn.co/image/ab67616d00001e022c0e1e9e1fd1e7b132da1606"

            
            let quote1 = Quote(context: self.container.viewContext)
            quote1.title = "I Like Me Better"
            quote1.text = "I like me better when I'm with you."
            quote1.albumCoverUrl = "https://i.scdn.co/image/ab67616d00001e02bdea30b86b37142ec99deb78"
            quote1.id = UUID()
            
            let quote2 = Quote(context: self.container.viewContext)
            quote2.title = "First Grade"
            quote2.text = "I wanna show you that it's okay to be who you are."
            quote2.albumCoverUrl = "https://i.scdn.co/image/ab67616d00001e0237a04015658168ca6e6e604a"
            quote2.id = UUID()
            
            do {
                try self.container.viewContext.save()
                print("Order saved.")
            } catch {
                print(error.localizedDescription)
            }
        }
        
        
    }
}
