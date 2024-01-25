//
//  GameLogicModel.swift
//  XOXO
//
//  Created by Buse Karabıyık on 25.01.2024.
//

import UIKit

struct GameLogicModel {
    
    
    internal func processPressLogic(forButton button: UIButton, currentPlayer playerCharacter: AttributedString) {
        if button.configuration?.attributedTitle == "" {
            button.configuration?.attributedTitle = playerCharacter
        }else {
            return
        }
    }
    
}
