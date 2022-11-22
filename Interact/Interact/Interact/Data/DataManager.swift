//
//  DataManager.swift
//  Interact
//
//  Created by Jeffrey on 11/22/22.
//

import UIKit

// firebase imports
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase

class DataManager {
    
    static var users : [UserData] = []
    static var messages : [MessageData] = []
    
    private static var callbacks : [DataLoadedCallback]  = []
    
    // firbase refs
    static var userRef: DatabaseReference!
    static var messageRef: DatabaseReference!


    
    static func registerCallback(callback: DataLoadedCallback) {
        callbacks.append(callback)
    }
    
    private static func pushEventToCallbacks() {
        for callback in callbacks {
            callback.onUserDataLoaded()
        }
    }
    
    static func startFirebaseLoad() {
        // MARK: User Data
        userRef = Database.database().reference()
        userRef
            .child(DataConstants.dbLoctionRoot)
            .child(DataConstants.dbLocationUsers)
            .observe(.value, with: {snapshot in
                users = []
                for case let childData as DataSnapshot in snapshot.children {
                    let name = DataUtil.formatName(name: childData.key)
                    
                    users.append(UserData(name: name))
                }
                for callback in callbacks {
                    callback.onUserDataLoaded()
                }
            })
        
        // MARK: Message Data
        messageRef = Database.database().reference()
        messageRef
            .child(DataConstants.dbLoctionRoot)
            .child(DataConstants.dbLocationMessage)
            .observe(.value, with: {snapshot in
                messages = []
                for case let childData as DataSnapshot in snapshot.children {
                    print(childData.description)
                    // self.nameString += childData.key + "\n" + "\n"
                }
                for callback in callbacks {
                    callback.onUserDataLoaded()
                }
            })
    }
    
    
}
