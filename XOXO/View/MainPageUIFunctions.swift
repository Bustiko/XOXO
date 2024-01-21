//
//  MainPageUIFunctions.swift
//  XOXO
//
//  Created by Buse Karabıyık on 21.01.2024.
//

import UIKit

struct MainPageUIFunctions {
    let uiFunctions = UIFunctions()
    let buttonTotal = 9
    
    func setupView(onView view: UIView) {
        let label = uiFunctions.makeLabel(withText: "YOUR TURN", withSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonView = ButtonsView(buttonTotal: buttonTotal)
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        view.addSubview(label)
        view.addSubview(buttonView)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 72),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonView.heightAnchor.constraint(equalToConstant: CGFloat(sqrt(Double(buttonTotal))*97)),
            buttonView.widthAnchor.constraint(equalToConstant: CGFloat(sqrt(Double(buttonTotal))*97))
            
        ])
    }
}
