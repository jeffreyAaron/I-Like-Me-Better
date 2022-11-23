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
    
    static var hasMessagesLoaded = false
    static var hasUsersLoaded = false



    
    static func registerCallback(callback: DataLoadedCallback) {
        callbacks.append(callback)
        
        if(hasUsersLoaded) {
            callback.onUserDataLoaded()
        }
        if(hasMessagesLoaded) {
            callback.onMessageDataLoaded()
        }
    }
    
    private static func pushUserEventToCallbacks() {
        for callback in callbacks {
            callback.onUserDataLoaded()
        }
        hasUsersLoaded = true
    }
    
    private static func pushMessageEventToCallbacks() {
        for callback in callbacks {
            callback.onMessageDataLoaded()
        }
        hasMessagesLoaded = true
    }
    
    static func pushMessage(messageData: MessageData) {
        let messageRef: DatabaseReference = Database.database().reference()
        guard let key = messageRef.child(DataConstants.dbLocationMessage).childByAutoId().key else { return }
        let message: [String : Any] = [
            DataConstants.dbLocationMessageDestination: messageData.destination,
            DataConstants.dbLocationMessageMessage: messageData.message,
            DataConstants.dbLocationMessageSource: messageData.source,
            DataConstants.dbLocationMessageTimestamp: messageData.timestamp
            ]
        let childUpdates = ["/\(DataConstants.dbLoctionRoot)/\(DataConstants.dbLocationMessage)/\(key)": message]
        
        messageRef.updateChildValues(childUpdates)
        
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
                pushUserEventToCallbacks()
                hasMessagesLoaded = true
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
                    
                    let value = childData.value as? NSDictionary

                    let destination = value?[DataConstants.dbLocationMessageDestination] as? String ?? ""
                    let message = value?[DataConstants.dbLocationMessageMessage] as? String ?? ""
                    let source = value?[DataConstants.dbLocationMessageSource] as? String ?? ""

                    messages.append(MessageData(destination: destination, message: message, source: source, timestamp: 0))
                    // self.nameString += childData.key + "\n" + "\n"
                }
                pushMessageEventToCallbacks()
            })
    }
    
    
}
