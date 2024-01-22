//
//  MainPageUIFunctions.swift
//  XOXO
//
//  Created by Buse Karabıyık on 21.01.2024.
//

import UIKit

struct MainPageUIFunctions {
    let uiFunctions = UIFunctions()
    let buttonTotal = 16
    
    func setupView(onView view: UIView, target: Any?, action: Selector ) {
        let label = uiFunctions.makeLabel(withText: "YOUR TURN", withSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonView = ButtonsView(buttonTotal: buttonTotal)
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        
        buttons[0].addTarget(target, action: action, for: .touchUpInside)
        
        view.addSubview(label)
        view.addSubview(buttonView)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30),
            buttonView.heightAnchor.constraint(equalToConstant: CGFloat(sqrt(Double(buttonTotal))*97)),
            buttonView.widthAnchor.constraint(equalToConstant: CGFloat(sqrt(Double(buttonTotal))*97))
            
        ])
    }
}
