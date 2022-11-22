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
    
    let scrollView = UIScrollView()
    let contentView = UIStackView()

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
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        firebaseDataLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        contentView.addSubview(firebaseDataLabel)
        scrollView.addSubview(contentView)
        firebaseDataLabel.numberOfLines = 100
        firebaseDataLabel.text = nameString
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            firebaseDataLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            firebaseDataLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            firebaseDataLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            firebaseDataLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            firebaseDataLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            firebaseDataLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor)

        ])
        
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
    }
    
    func loadFirebaseData() {
        ref = Database.database().reference()
        ref
            .child("i-like-me-better")
            .child("users")
            .observe(.value, with: {snapshot in
                self.nameString = ""
                for case let childData as DataSnapshot in snapshot.children {
                    print(childData.key)
                    self.nameString += childData.key + "\n" + "\n"
                }
                print(self.nameString)
                self.setUpFirebaseLabel()
            })
    }


}

