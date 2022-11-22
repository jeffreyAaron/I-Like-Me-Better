//
//  RichardTableViewCell.swift
//  Learn Firebase
//
//  Created by Jeffrey on 11/22/22.
//

import UIKit

class RichardTableViewCell: UITableViewCell {
    
    var richardImageView = UIImageView()
    var richardTitleLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(richardImageView)
        addSubview(richardTitleLabel)
        configureImageView()
        configureTitleLabel()
        setImageConstraints()
        setLabelConstrasints()
    }
    
    func set(name: String) {
        richardImageView.image = UIImage(systemName: "scribble.variable")

        if name == "richard" {
            richardImageView.image = UIImage(systemName: "heart")
        }

        richardTitleLabel.text = name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImageView() {
        richardImageView.layer.cornerRadius = 10
        richardImageView.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        richardTitleLabel.numberOfLines = 0
        richardTitleLabel.adjustsFontSizeToFitWidth = true
        // richardTitleLabel.font = 
    }
    
    func setImageConstraints() {
        richardImageView.translatesAutoresizingMaskIntoConstraints  = false
        NSLayoutConstraint.activate([
            richardImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            richardImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            richardImageView.heightAnchor.constraint(equalToConstant: 80),
            richardImageView.widthAnchor.constraint(equalTo: richardImageView.heightAnchor, multiplier: 1)
        ])
    }
    
    func setLabelConstrasints() {
        richardTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            richardTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            richardTitleLabel.leadingAnchor.constraint(equalTo: richardImageView.trailingAnchor, constant: 12),
            richardTitleLabel.heightAnchor.constraint(equalToConstant: 80),
            richardTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }

}
