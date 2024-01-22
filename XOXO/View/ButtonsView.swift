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
            buttons.append(button)
            self.addSubview(button)
        }
        
        var currentMiddleRow = 0
        
        for x in 0..<(buttonTotal) {
            
            buttons[x].widthAnchor.constraint(equalToConstant: 97).isActive = true
            buttons[x].heightAnchor.constraint(equalToConstant: 97).isActive = true
            buttons[x].translatesAutoresizingMaskIntoConstraints = false
        
            if x >= 0 && x <= (squareRooted-1) {
                if x == 0 {
                    
                    buttons[x].leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
                    buttons[x].trailingAnchor.constraint(equalTo: buttons[x+1].leadingAnchor).isActive = true
                    buttons[x].topAnchor.constraint(equalTo: self.topAnchor).isActive = true
                    
                }else if x == (squareRooted-1) {
                    
                    buttons[x].leadingAnchor.constraint(equalTo: buttons[x-1].trailingAnchor).isActive = true
                    buttons[x].trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
                    buttons[x].topAnchor.constraint(equalTo: self.topAnchor).isActive = true
                    
                }else {
                
                    buttons[x].leadingAnchor.constraint(equalTo: buttons[x-1].trailingAnchor).isActive = true
                    buttons[x].trailingAnchor.constraint(equalTo: buttons[x+1].leadingAnchor).isActive = true
                    buttons[x].topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    
                }
            }else if x >= squareRooted && x < (buttonTotal-squareRooted) {
                currentMiddleRow += 1
                
                if x == squareRooted*currentMiddleRow {
                    
                    buttons[x].leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
                    buttons[x].trailingAnchor.constraint(equalTo: buttons[x+1].leadingAnchor).isActive = true
                    buttons[x].topAnchor.constraint(equalTo: buttons[x-squareRooted].bottomAnchor).isActive = true
                    
                }else if x == (squareRooted*currentMiddleRow-1) {
                    currentMiddleRow -= 1
                    buttons[x].leadingAnchor.constraint(equalTo: buttons[x-1].trailingAnchor).isActive = true
                    buttons[x].trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
                    buttons[x].topAnchor.constraint(equalTo: buttons[x-squareRooted].bottomAnchor).isActive = true
                    
                }else {
                    currentMiddleRow -= 1
                    buttons[x].leadingAnchor.constraint(equalTo: buttons[x-1].trailingAnchor).isActive = true
                    buttons[x].trailingAnchor.constraint(equalTo: buttons[x+1].leadingAnchor).isActive = true
                    buttons[x].topAnchor.constraint(equalTo: buttons[x-squareRooted].bottomAnchor).isActive = true
        
                }
                
            }else {
                if x == (buttonTotal-squareRooted) {
                    
                    buttons[x].leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
                    buttons[x].trailingAnchor.constraint(equalTo: buttons[x+1].leadingAnchor).isActive = true
                    buttons[x].topAnchor.constraint(equalTo: buttons[x-squareRooted].bottomAnchor).isActive = true
                    
                }else if x == buttonTotal-1 {
                    
                    buttons[x].leadingAnchor.constraint(equalTo: buttons[x-1].trailingAnchor).isActive = true
                    buttons[x].trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
                    buttons[x].topAnchor.constraint(equalTo: buttons[x-squareRooted].bottomAnchor).isActive = true
                    
                }else {
                    
                    buttons[x].leadingAnchor.constraint(equalTo: buttons[x-1].trailingAnchor).isActive = true
                    buttons[x].trailingAnchor.constraint(equalTo: buttons[x+1].leadingAnchor).isActive = true
                    buttons[x].topAnchor.constraint(equalTo: buttons[x-squareRooted].bottomAnchor).isActive = true
                    
                }
                
            }
        }
        
    }
    
}
