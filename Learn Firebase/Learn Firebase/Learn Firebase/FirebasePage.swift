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
        scrollView.addSubview(firebaseDataLabel)
        firebaseDataLabel.numberOfLines = 100
        firebaseDataLabel.text = nameString
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            firebaseDataLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            firebaseDataLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            firebaseDataLabel.topAnchor.constraint(equalTo: scrollView.topAnchor),
            firebaseDataLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            firebaseDataLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        
        
//        view.addSubview(scrollView)
//
//
//        // scrollView.backgroundColor = .blue
//
//        NSLayoutConstraint.activate([
//            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//
//        ])
//
//
//        // contentView.addSubview(firebaseDataLabel)
//
//        contentView.axis = .vertical
//
//        NSLayoutConstraint.activate([
//            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
//            contentView.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor),
//            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
//            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
//            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
//        ])
//
//        firebaseDataLabel.numberOfLines = 50
//        firebaseDataLabel.text = nameString
//
//        contentView.addArrangedSubview(firebaseDataLabel)
//
//
//
//        NSLayoutConstraint.activate([
//            firebaseDataLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
//            firebaseDataLabel.heightAnchor.constraint(equalToConstant: firebaseDataLabel.frame.height),
//
//        ])
//
//        scrollView.addSubview(contentView)
//
//
//        // contentView.heightAnchor.constraint(equalTo: firebaseDataLabel.heightAnchor).isActive = true
//
//
//        // scrollView.contentSize = contentView.frame.size

        
    }
    
    func loadFirebaseData() {
        ref = Database.database().reference()
        ref
            .child("i-like-me-better")
            .child("users")
            .observe(.value, with: {snapshot in
                for case let childData as DataSnapshot in snapshot.children {
                    print(childData.key)
                    self.nameString += childData.key + "\n" + "\n"
                }
                print(self.nameString)
                self.setUpFirebaseLabel()
            })
        
        
    }


}

