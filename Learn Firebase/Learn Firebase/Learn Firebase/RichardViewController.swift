//
//  RichardViewController.swift
//  Learn Firebase
//
//  Created by Jeffrey on 11/22/22.
//

import UIKit

// firebase imports
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import FirebaseDatabase

class RichardViewController: UIViewController {
    
    var tableView = UITableView()
    
    var ref: DatabaseReference!
    
    var nameStrings: [String] = []
    
    struct Cells {
        static let richardTableViewCell = "RichardTableViewCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationUI()

        fetchData()
        
        
        // Do any additional setup after loading the view.
    }
    
    func fetchData() {
        loadFirebaseData()
    }
    
    func dataDidLoad() {
        configureTableView()
    }
    
    func setUpNavigationUI () {
        view.backgroundColor = .systemBlue
        title = "firebase loading"
    }
    
    func configureTableView () {
        view.addSubview(tableView)
        
        setTableViewDelegate()
        tableView.rowHeight = 100
        tableView.register(RichardTableViewCell.self, forCellReuseIdentifier: Cells.richardTableViewCell)
        tableView.pin(to: view)
        
    }
    
    func setTableViewDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension RichardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameStrings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.richardTableViewCell) as! RichardTableViewCell
        cell.set(name: nameStrings[indexPath.row])
        return cell
    }
    
    func loadFirebaseData() {
        ref = Database.database().reference()
        ref
            .child("i-like-me-better")
            .child("users")
            .observe(.value, with: {snapshot in
                for case let childData as DataSnapshot in snapshot.children {
                    print(childData.key)
                    self.nameStrings.append(childData.key)

                }
                self.dataDidLoad()
            })
    }

    
    
}
