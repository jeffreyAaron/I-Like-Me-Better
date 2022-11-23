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
    
    var inputContentView = UIView()
    var inputTextField = UITextField()
    var inputButton = UIButton();

    func setData(user: UserData) {
        self.user = user
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = user.name
        
        configureInputContentView()
        configureMessageList()
        
        DataManager.registerCallback(callback: self)
    }
    
    func configureInputContentView() {
        inputContentView.translatesAutoresizingMaskIntoConstraints = false
        inputTextField.translatesAutoresizingMaskIntoConstraints = false
        inputButton.translatesAutoresizingMaskIntoConstraints = false

        // target
        inputButton.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        
        // Contentview
        inputContentView.backgroundColor = .lightGray
        
        // Button
        inputButton.setTitle(NSLocalizedString("Send", comment: ""), for: .normal)
        inputButton.setTitleColor(.black, for: .normal)
        inputButton.backgroundColor = .systemBlue
        inputButton.configuration?.buttonSize = .large
        
        // Textfield
        inputTextField.backgroundColor = .systemRed
        inputTextField.placeholder = "Enter your compliment here"
        
        inputContentView.addSubview(inputTextField)
        inputContentView.addSubview(inputButton)
        view.addSubview(inputContentView)
                
        // set contraints
        NSLayoutConstraint.activate([
            inputContentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            inputContentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            inputContentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            inputContentView.heightAnchor.constraint(equalTo: inputContentView.widthAnchor, multiplier: 1/2)
        ])
        
        // set contraints
        NSLayoutConstraint.activate([
            inputTextField.leadingAnchor.constraint(equalTo: inputContentView.leadingAnchor),
            inputTextField.trailingAnchor.constraint(equalTo: inputContentView.trailingAnchor),
            inputTextField.topAnchor.constraint(equalTo: inputContentView.topAnchor),
            inputTextField.bottomAnchor.constraint(equalTo: inputButton.topAnchor),
            inputTextField.heightAnchor.constraint(equalTo: inputContentView.heightAnchor, multiplier: 2/3)
        ])
        
        // set contraints
        NSLayoutConstraint.activate([
            inputButton.leadingAnchor.constraint(equalTo: inputContentView.leadingAnchor),
            inputButton.trailingAnchor.constraint(equalTo: inputContentView.trailingAnchor),
            inputButton.topAnchor.constraint(equalTo: inputTextField.bottomAnchor),
            inputButton.bottomAnchor.constraint(equalTo: inputContentView.bottomAnchor),
            inputButton.heightAnchor.constraint(equalTo: inputContentView.heightAnchor, multiplier: 1/3)
        ])
        
        // inputTextField.pin(to: inputContentView)
        // inputContentView.heightAnchor.constraint(equalToConstant: 100).isActive = true

    }

    
    
    func configureMessageList() {
        view.addSubview(messageLabel)
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        
        // set contraints
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            messageLabel.bottomAnchor.constraint(equalTo: inputContentView.topAnchor)
        ])
    }
    
    func updateMessageLabel() {
        
        print(messageList.description)
        
        if(messageList.isEmpty) {
            messageLabel.text = "No Messages"
            return
        }
        
        var text = "\(user.name)'s Messages:\n"
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

    
    @objc func sendMessage() {
        print("send message")
        let messageToSend = inputTextField.text
        inputTextField.text = ""
        
        DataManager.pushMessage(messageData:
                                    MessageData(destination: user.name,
                                                message: messageToSend ?? "message failed to send",
                                                source: DataConstants.anonymousMessage,
                                                timestamp: 0
                                               ))
        
    }
   

}
