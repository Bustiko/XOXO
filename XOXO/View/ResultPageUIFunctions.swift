//
//  ResultPageUIFunctions.swift
//  XOXO
//
//  Created by Buse Karabıyık on 21.01.2024.
//

import UIKit

struct ResultPageUIFunctions {
    
    let uifunctions = UIFunctions()
    
    func setupView(onView view: UIView) {
        let label = uifunctions.makeLabel(withText: "YOU WIN", withSize: 50)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let button = uifunctions.makeButton(withtext: "Play Again")
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        view.addSubview(button)
        
        
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
