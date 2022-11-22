//
//  MessageData.swift
//  Interact
//
//  Created by Jeffrey on 11/22/22.
//

import Foundation

class MessageData {
    var destination : String
    var message : String
    var source : String
    var timestamp : UInt64

    init(destination: String, message: String, source: String, timestamp: UInt64) {
        self.destination = destination
        self.message = message
        self.source = source
        self.timestamp = timestamp
    }

}
