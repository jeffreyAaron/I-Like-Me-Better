//
//  UserTableViewCell.swift
//  Interact
//
//  Created by Jeffrey on 11/22/22.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    let titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureTitleLabel()
    }
    
    
    func configureTitleLabel() {
        addSubview(titleLabel)
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textAlignment = .center
        titleLabel.pin(to: self)
    }
    
    func set(user: UserData) {
        print(user.name)
        titleLabel.text = user.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
