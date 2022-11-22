//
//  HomeViewController.swift
//  Interact
//
//  Created by Jeffrey on 11/22/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    let tableView = UITableView()
    
    struct Cells {
        static let userTableViewCell = "UserTableViewCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        DataManager.registerCallback(callback: self)
        
        setUpNavigationUI()
        configureTableView()
    }
    
    func setUpNavigationUI() {
        title = "Interact"
    }
    
    func configureTableView () {
        view.addSubview(tableView)
        
        setTableViewDelegate()
        tableView.rowHeight = 100
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: Cells.userTableViewCell)
        tableView.pin(to: view)
        
    }
    
    func setTableViewDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension HomeViewController: DataLoadedCallback, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.userTableViewCell) as! UserTableViewCell
        cell.set(user: DataManager.users[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(DataManager.users[indexPath.row].name)
        openMessageScreen(user: DataManager.users[indexPath.row])
    }
    
    func onUserDataLoaded() {
        tableView.reloadData()
    }
    
    func onMessageDataLoaded() {
        
    }
    
    func openMessageScreen (user: UserData) {
        let messageScreen = MessageViewController()
        messageScreen.setData(user: user)
        navigationController?.pushViewController(messageScreen, animated: true)
    }
    
}
