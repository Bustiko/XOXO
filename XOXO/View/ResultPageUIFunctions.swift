//
//  ResultPageUIFunctions.swift
//  XOXO
//
//  Created by Buse Karabıyık on 21.01.2024.
//

import UIKit

struct ResultPageUIFunctions {
    
    let uifunctions = UIFunctions()
    var label = UILabel()
    
    mutating func setupView(onView view: UIView, target: Any?, action: Selector) {
        label = uifunctions.makeLabel(withText: "YOU WIN", withSize: 50)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let button = uifunctions.makeButton(withtext: "Play Again")
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        view.addSubview(button)
        
        button.addTarget(target, action: action, for: .touchUpInside)
        
        view.backgroundColor = UIColor(red: 0.99, green: 0.96, blue: 0.93, alpha: 1.00)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            button.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        
    }
}
