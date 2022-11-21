//
//  SecondScreen.swift
//  Lauv-UI
//
//  Created by Jeffrey on 11/20/22.
//

import UIKit

class SecondScreen: UIViewController {
    
    let lauvLabel = UILabel()
    
    let nameLabel = UILabel()
    
    var timer: Timer? = nil
    
    var index : Int = 0
    
    let names : [String] = ["you", "kaitlyn", "hannah", "jennifer", "rachel", "both kelly's :)", "krystal", "richard", "pailin", "sahanna", "xing", "shin", "cody", "nipun", "celena", "aiden", "angela", "channing", "cindy", "ekam", "jesse", "mathew", "may", "sophie", "tia", "yingchi", "aaron"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationController?.navigationBar.tintColor = .black
        
        title = "App Dev Team :)"
        
        setUpLauvLabel()

        // Do any additional setup after loading the view.
    }
    
    func setUpLauvLabel () {
        view.addSubview(lauvLabel)
        view.addSubview(nameLabel)

        lauvLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            lauvLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            lauvLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        lauvLabel.textAlignment = .center
        lauvLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        lauvLabel.font = lauvLabel.font.withSize(40)
        lauvLabel.numberOfLines = 2
        lauvLabel.text = "I like me better\nwhen I'm with"
        lauvLabel.textColor = .blue
        lauvLabel.shadowColor = .lightGray
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.centerYAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        nameLabel.font = lauvLabel.font.withSize(50)
        nameLabel.text = "you"
        nameLabel.shadowColor = .lightGray
        nameLabel.shadowOffset = CGSize(width: 5, height: 5)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(updateViewWithName), userInfo: nil, repeats: true)
    
        
    }
    
    @objc func updateViewWithName() {
        print("run timer")
        
        nameLabel.text = names[index % names.count]

        index+=1;
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
