//
//  ButtonsView.swift
//  XOXO
//
//  Created by Buse Karabıyık on 21.01.2024.
//

import UIKit

class ButtonsView: UIView {
    
    private let uiFunctions = UIFunctions()
    private var buttonTotal = 9
    
    private var buttons: [UIButton] = []
    
    init(buttonTotal: Int) {
        self.buttonTotal = buttonTotal
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func setupView() {
        let buttonTotalRooted = Int(sqrt(Double(buttonTotal)))
        
        for _ in 0..<(buttonTotal) {
            let button = uiFunctions.makeXOButton()
            buttons.append(button)
            self.addSubview(button)
        }
        
        
        for x in 0..<(buttonTotal) {
            buttons[x].widthAnchor.constraint(equalToConstant: 97).isActive = true
            buttons[x].heightAnchor.constraint(equalToConstant: 97).isActive = true
            buttons[x].translatesAutoresizingMaskIntoConstraints = false
            
            switch x {
            case 0:
                buttons[x].leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
                buttons[x].trailingAnchor.constraint(equalTo: buttons[x+1].leadingAnchor).isActive = true
                buttons[x].topAnchor.constraint(equalTo: self.topAnchor).isActive = true
                break
            case 1:
                buttons[x].leadingAnchor.constraint(equalTo: buttons[x-1].trailingAnchor).isActive = true
                buttons[x].trailingAnchor.constraint(equalTo: buttons[x+1].leadingAnchor).isActive = true
                buttons[x].topAnchor.constraint(equalTo: self.topAnchor).isActive = true
                break
            case 2:
                buttons[x].leadingAnchor.constraint(equalTo: buttons[x-1].trailingAnchor).isActive = true
                buttons[x].trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
                buttons[x].topAnchor.constraint(equalTo: self.topAnchor).isActive = true
                break
            case 3:
                buttons[x].leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
                buttons[x].trailingAnchor.constraint(equalTo: buttons[x+1].leadingAnchor).isActive = true
                buttons[x].topAnchor.constraint(equalTo: buttons[0].bottomAnchor).isActive = true
                break
            case 4:
                buttons[x].leadingAnchor.constraint(equalTo: buttons[x-1].trailingAnchor).isActive = true
                buttons[x].trailingAnchor.constraint(equalTo: buttons[x+1].leadingAnchor).isActive = true
                buttons[x].topAnchor.constraint(equalTo: buttons[0].bottomAnchor).isActive = true
                break
            case 5:
                buttons[x].leadingAnchor.constraint(equalTo: buttons[x-1].trailingAnchor).isActive = true
                buttons[x].trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
                buttons[x].topAnchor.constraint(equalTo: buttons[0].bottomAnchor).isActive = true
                break
            case 6:
                buttons[x].leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
                buttons[x].trailingAnchor.constraint(equalTo: buttons[x+1].leadingAnchor).isActive = true
                buttons[x].topAnchor.constraint(equalTo: buttons[3].bottomAnchor).isActive = true
                break
            case 7:
                buttons[x].leadingAnchor.constraint(equalTo: buttons[x-1].trailingAnchor).isActive = true
                buttons[x].trailingAnchor.constraint(equalTo: buttons[x+1].leadingAnchor).isActive = true
                buttons[x].topAnchor.constraint(equalTo: buttons[3].bottomAnchor).isActive = true
                break
            case 8:
                buttons[x].leadingAnchor.constraint(equalTo: buttons[x-1].trailingAnchor).isActive = true
                buttons[x].trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
                buttons[x].topAnchor.constraint(equalTo: buttons[3].bottomAnchor).isActive = true
                break
            default:
                break
            }
            
        }
    }
    
}
