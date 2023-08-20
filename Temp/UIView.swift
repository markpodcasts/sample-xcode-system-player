//
//  UIView.swift
//  Temp
//
//  Created by Тимур Куашев on 20.08.2023.
//

import UIKit

enum ViewSides {
    case left, top, right, bottom
    case all4Sides, all6Sides
    case centerX, centerY
}

extension UIView {
    func attachTo(view: UIView, toSides sides: [ViewSides], constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self)
        
        for side in sides {
            switch side {
            case .left:
                self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: constant).isActive = true
            case .top:
                self.topAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true
            case .right:
                self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: constant).isActive = true
            case .bottom:
                self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: constant).isActive = true
            case .centerX:
                self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            case .centerY:
                self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            case .all4Sides:
                NSLayoutConstraint.activate([
                    self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: constant),
                    self.topAnchor.constraint(equalTo: view.topAnchor, constant: constant),
                    self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: constant),
                    self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: constant)
                ])
            case .all6Sides:
                NSLayoutConstraint.activate([
                    self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: constant),
                    self.topAnchor.constraint(equalTo: view.topAnchor, constant: constant),
                    self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: constant),
                    self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: constant),
                    
                    self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    self.centerYAnchor.constraint(equalTo: view.centerYAnchor)
                ])
            }
        }
    }
    
}
