//
//  ButtonsView.swift
//  XOXO
//
//  Created by Buse Karabıyık on 21.01.2024.
//

import UIKit



class ButtonsView: UIView {
    
    private let uiFunctions = UIFunctions()
    private var buttonTotal: Int
    
    init(buttonTotal: Int) {
        self.buttonTotal = buttonTotal
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func setupView() {
        
        let squareRooted = Int(sqrt(Double(buttonTotal)))
        
        for x in 0..<(buttonTotal) {
            let button = uiFunctions.makeXOButton()
            button.accessibilityIdentifier = "\(x)"
            Singletons.buttons.append(button)
            self.addSubview(button)
        }
        
        var currentMiddleRow = 0
        
        for x in 0..<(buttonTotal) {
            
            Singletons.buttons[x].widthAnchor.constraint(equalToConstant: 97).isActive = true
            Singletons.buttons[x].heightAnchor.constraint(equalToConstant: 97).isActive = true
            Singletons.buttons[x].translatesAutoresizingMaskIntoConstraints = false
        
            if x >= 0 && x <= (squareRooted-1) {
                if x == 0 {
                    
                    Singletons.buttons[x].leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
                    Singletons.buttons[x].trailingAnchor.constraint(equalTo: Singletons.buttons[x+1].leadingAnchor).isActive = true
                    Singletons.buttons[x].topAnchor.constraint(equalTo: self.topAnchor).isActive = true
                    
                }else if x == (squareRooted-1) {
                    
                    Singletons.buttons[x].leadingAnchor.constraint(equalTo: Singletons.buttons[x-1].trailingAnchor).isActive = true
                    Singletons.buttons[x].trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
                    Singletons.buttons[x].topAnchor.constraint(equalTo: self.topAnchor).isActive = true
                    
                }else {
                
                    Singletons.buttons[x].leadingAnchor.constraint(equalTo: Singletons.buttons[x-1].trailingAnchor).isActive = true
                    Singletons.buttons[x].trailingAnchor.constraint(equalTo: Singletons.buttons[x+1].leadingAnchor).isActive = true
                    Singletons.buttons[x].topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    
                }
            }else if x >= squareRooted && x < (buttonTotal-squareRooted) {
                currentMiddleRow += 1
                
                if x == squareRooted*currentMiddleRow {
                    
                    Singletons.buttons[x].leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
                    Singletons.buttons[x].trailingAnchor.constraint(equalTo: Singletons.buttons[x+1].leadingAnchor).isActive = true
                    Singletons.buttons[x].topAnchor.constraint(equalTo: Singletons.buttons[x-squareRooted].bottomAnchor).isActive = true
                    
                }else if x == (squareRooted*currentMiddleRow-1) {
                    currentMiddleRow -= 1
                    Singletons.buttons[x].leadingAnchor.constraint(equalTo: Singletons.buttons[x-1].trailingAnchor).isActive = true
                    Singletons.buttons[x].trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
                    Singletons.buttons[x].topAnchor.constraint(equalTo: Singletons.buttons[x-squareRooted].bottomAnchor).isActive = true
                    
                }else {
                    currentMiddleRow -= 1
                    Singletons.buttons[x].leadingAnchor.constraint(equalTo: Singletons.buttons[x-1].trailingAnchor).isActive = true
                    Singletons.buttons[x].trailingAnchor.constraint(equalTo: Singletons.buttons[x+1].leadingAnchor).isActive = true
                    Singletons.buttons[x].topAnchor.constraint(equalTo: Singletons.buttons[x-squareRooted].bottomAnchor).isActive = true
        
                }
                
            }else {
                if x == (buttonTotal-squareRooted) {
                    
                    Singletons.buttons[x].leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
                    Singletons.buttons[x].trailingAnchor.constraint(equalTo: Singletons.buttons[x+1].leadingAnchor).isActive = true
                    Singletons.buttons[x].topAnchor.constraint(equalTo: Singletons.buttons[x-squareRooted].bottomAnchor).isActive = true
                    
                }else if x == buttonTotal-1 {
                    
                    Singletons.buttons[x].leadingAnchor.constraint(equalTo: Singletons.buttons[x-1].trailingAnchor).isActive = true
                    Singletons.buttons[x].trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
                    Singletons.buttons[x].topAnchor.constraint(equalTo: Singletons.buttons[x-squareRooted].bottomAnchor).isActive = true
                    
                }else {
                    
                    Singletons.buttons[x].leadingAnchor.constraint(equalTo: Singletons.buttons[x-1].trailingAnchor).isActive = true
                    Singletons.buttons[x].trailingAnchor.constraint(equalTo: Singletons.buttons[x+1].leadingAnchor).isActive = true
                    Singletons.buttons[x].topAnchor.constraint(equalTo: Singletons.buttons[x-squareRooted].bottomAnchor).isActive = true
                    
                }
                
            }
        }
        
    }
    
}
