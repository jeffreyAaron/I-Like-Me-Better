//
//  ViewController.swift
//  Interact
//
//  Created by Jeffrey on 11/22/22.
//

import UIKit

class MessageViewController: UIViewController, DataLoadedCallback {
    
    var user:UserData! = nil
    
    var messageList: [MessageData] = []
    var messageLabel = UILabel()

    func setData(user: UserData) {
        self.user = user
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = user.name
        
        configureMessageList()
        
        DataManager.registerCallback(callback: self)
    }
    
    
    func configureMessageList() {
        view.addSubview(messageLabel)
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.pin(to: view)
    }
    
    func updateMessageLabel() {
        
        print(messageList.description)
        
        if(messageList.isEmpty) {
            messageLabel.text = "No Messages"
            return
        }
        
        var text = "Your Messages:\n"
        for message in messageList {
            print(message.message)
            text += "- " + message.message + "\n"
        }
        
        
        messageLabel.text = text
    }

    
    func onUserDataLoaded() {
        // no need
    }
    
    func onMessageDataLoaded() {
        // update the list
        messageList = DataUtil.findMessageByUser(user: user)
        updateMessageLabel()
    }

   

}
