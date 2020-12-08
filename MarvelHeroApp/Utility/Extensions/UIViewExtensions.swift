//
//  UIViewControllerExtensions.swift
//  MarvelHeroApp
//
//  Created by Ajay Odedra on 22/09/20.
//

import Foundation
import UIKit

extension UIView {
    
    func setRoundedBorder(){
        layer.cornerRadius = 5
        layer.borderWidth = 0.4
        layer.borderColor = UIColor.darkGray.cgColor
        clipsToBounds = true
    }
    
    func fillSuperview() {
        guard let superview = superview else { return }
        active([
            trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            topAnchor.constraint(equalTo: superview.topAnchor, constant: 300),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            widthAnchor.constraint(equalToConstant: 50),
            heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func active(_ constraints: [NSLayoutConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
    
}
