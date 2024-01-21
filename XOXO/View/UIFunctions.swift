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
        
        return label
    }
    
    internal func makeXOButton() -> UIButton {
        let button = UIButton()
        
        var config = UIButton.Configuration.filled()
        config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        
        
        button.setTitle("1", for: .normal)
        button.titleLabel?.textColor = .white
        
        button.configuration = config
        
        
        return button
        
    }
    
    internal func makeButton(withtext text: String) -> UIButton {
        let button = UIButton()
        
        var config = UIButton.Configuration.filled()
        config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        config.cornerStyle = .capsule
        
        button.setTitle(text, for: .normal)
        button.titleLabel?.textColor = .white
        
        button.configuration = config
        
        
        return button
        
    }
}
