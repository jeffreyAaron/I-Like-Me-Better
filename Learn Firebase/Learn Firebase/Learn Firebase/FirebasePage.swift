//
//  ViewController.swift
//  Learn Firebase
//
//  Created by Jeffrey on 11/20/22.
//

// firebase imports
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import FirebaseDatabase

import UIKit

class FirebasePage: UIViewController {
    
    let firebaseDataLabel = UILabel()
    
    var nameString: String = ""
    
    var ref: DatabaseReference!


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        // Do any additional setup after loading the view.
        
        loadFirebaseData()
        
    }
    
    func setUpFirebaseLabel() {
        view.addSubview(firebaseDataLabel)
        
        firebaseDataLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firebaseDataLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firebaseDataLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        firebaseDataLabel.numberOfLines = 30
        firebaseDataLabel.text = nameString
    }
    
    func loadFirebaseData() {
        ref = Database.database().reference()
        ref
            .child("i-like-me-better")
            .child("users")
            .observe(.value, with: {snapshot in
                for case let childData as DataSnapshot in snapshot.children {
                    print(childData.key)
                    self.nameString += childData.key + "\n"
                }
                print(self.nameString)
                self.setUpFirebaseLabel()
            })
        
        
    }


}

