//
//  ViewController.swift
//  Lauv-UI
//
//  Created by Jeffrey on 11/20/22.
//

import UIKit

class FirstScreen: UIViewController {
    
    let lauvButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        title = "An \"App\""
        navigationController?.navigationBar.prefersLargeTitles = true

        // Do any additional setup after loading the view.
        setUpButton()
    }
    
    func setUpButton () {
        view.addSubview(lauvButton)
        
        lauvButton.configuration = .filled()
        lauvButton.configuration?.baseBackgroundColor = .systemBlue
        lauvButton.configuration?.title = "Click me"
        
        lauvButton.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
        
        lauvButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lauvButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lauvButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            lauvButton.widthAnchor.constraint(equalToConstant: 200),
            lauvButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        

        
    }
    
    @objc func goToNextScreen() {
        let nextScreen = SecondScreen()
        navigationController?.pushViewController(nextScreen, animated: true)
    }


}

