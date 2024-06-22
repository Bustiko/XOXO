//
//  MainPageUIFunctions.swift
//  XOXO
//
//  Created by Buse Karabıyık on 21.01.2024.
//

import UIKit


struct MainPageUIFunctions {
    let uiFunctions = UIFunctions()
    var label = UILabel()
    
    mutating func setupView(onView view: UIView, target: Any?, action: Selector ) {
        label = uiFunctions.makeLabel(withText: "YOUR TURN", withSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonView = ButtonsView(buttonTotal: Variables.buttonTotal)
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        addButtonTarget(target: target, action: action)
        
        view.addSubview(label)
        view.addSubview(buttonView)
        
        view.backgroundColor = UIColor(red: 0.99, green: 0.96, blue: 0.93, alpha: 1.00)
        view.accessibilityIdentifier = "MainPageView"
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30),
            buttonView.heightAnchor.constraint(equalToConstant: CGFloat(sqrt(Double(Variables.buttonTotal))*97)),
            buttonView.widthAnchor.constraint(equalToConstant: CGFloat(sqrt(Double(Variables.buttonTotal))*97))
            
        ])
    }
    
    func addButtonTarget(target: Any?, action: Selector) {
        
        for button in Variables.buttons {
            button.addTarget(target, action: action, for: .touchUpInside)
        }
        
    }
}
