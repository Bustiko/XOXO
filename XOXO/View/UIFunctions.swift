//
//  UIFunctions.swift
//  XOXO
//
//  Created by Buse Karabıyık on 21.01.2024.
//

import UIKit

struct UIFunctions {
    
    internal func makeLabel(withText text: String, withSize size: CGFloat) -> UILabel {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = UIFont(name: "Chalkduster", size: size)
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.98, green: 0.71, blue: 0.45, alpha: 1.00)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }
    
    internal func makeXOButton() -> UIButton {
        let button = UIButton()
        
        var container = AttributeContainer()
        container.font = UIFont(name: "Chalkduster", size: 50)
        container.foregroundColor = .white
        
       
        var config = UIButton.Configuration.filled()
        config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        config.baseBackgroundColor = UIColor(red: 0.98, green: 0.71, blue: 0.45, alpha: 1.00)
        config.attributedTitle = AttributedString("", attributes: container)

    
        button.configuration = config
       
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        
        return button
        
    }
    
    internal func makeButton(withtext text: String) -> UIButton {
        let button = UIButton()
        
        var container = AttributeContainer()
        container.font = UIFont(name: "Chalkduster", size: 30)
        container.foregroundColor = .white
        
       
        var config = UIButton.Configuration.filled()
        config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        config.baseBackgroundColor = UIColor(red: 0.98, green: 0.71, blue: 0.45, alpha: 1.00)
        config.attributedTitle = AttributedString("Play Again", attributes: container)
        config.cornerStyle = .capsule
        

    
        button.configuration = config
       
        
        return button
        
    }
}
