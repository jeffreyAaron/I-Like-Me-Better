//
//  DataUtil.swift
//  Interact
//
//  Created by Jeffrey on 11/22/22.
//

import Foundation


/*
 I'm on a time crunch, there's a better way to do this
 But this is designed so that you send your data to it and it will analyze it and compute values for you
 */
class DataUtil {
    static func formatName(name: String) -> String {
        return name.replacingOccurrences(of: "-", with: " ")
    }
}
