//
//  GameLogicModel.swift
//  XOXO
//
//  Created by Buse Karabıyık on 25.01.2024.
//

import UIKit

struct GameLogicModel {
    
    internal var currentPlayer: AttributedString = "X"
    private var correct = 0
    
    
    internal mutating func createAttributedString() {
        
        container.font = UIFont(name: "Chalkduster", size: 50)
        
        currentPlayer = AttributedString("X", attributes: container)
    }
    
    internal mutating func processPressLogic(forButton button: UIButton, currentPlayer playerCharacter: AttributedString) {
        if button.configuration?.attributedTitle == "" {
            button.configuration?.attributedTitle = playerCharacter
            currentPlayer = getNextPlayer(currentCharacter: playerCharacter)
        }else {
            return
        }
    }
    
    internal mutating func getNextPlayer(currentCharacter: AttributedString) -> AttributedString {
        
        if currentCharacter == AttributedString("X", attributes: container) {
            return AttributedString("O", attributes: container)
        }else {
            return AttributedString("X", attributes: container)
        }
        
    }
    
    internal mutating func decideChampion() -> AttributedString {
        
        // horizantol win
        for row in 0..<buttonTotalSquared {
            correct = 0
            let startIndex = row * buttonTotalSquared
            if let title = buttons[startIndex].configuration?.attributedTitle,
               title != "" {
                for x in 1...buttonTotalSquared-1 {
                    if title == buttons[startIndex + x].configuration?.attributedTitle {
                        correct += 1
                    }
                }
                if correct == buttonTotalSquared-1 {
                    return getNextPlayer(currentCharacter: currentPlayer)
                }
            }
        }
        
        //vertical win
        for col in 0..<buttonTotalSquared {
            correct = 0
            if let title = buttons[col].configuration?.attributedTitle,
               title != "" {
                for x in 1..<buttonTotalSquared {
                    if title == buttons[col + x*buttonTotalSquared].configuration?.attributedTitle {
                        correct += 1
                    }
                }
                if correct == buttonTotalSquared-1 {
                    return getNextPlayer(currentCharacter: currentPlayer)
                }
            }
        }
        
        //diagonal win
        if let title = buttons[0].configuration?.attributedTitle,
           title != "" {
            correct = 0
            for x in 1..<buttonTotalSquared {
                if title == buttons[buttonTotalSquared*x + x].configuration?.attributedTitle {
                    correct += 1
                }
            }
            if correct == buttonTotalSquared-1 {
                return getNextPlayer(currentCharacter: currentPlayer)
            }
         }
            
        if let title = buttons[buttonTotalSquared-1].configuration?.attributedTitle,
           title != "" {
            correct = 0
            for x in 1..<buttonTotalSquared {
                if title == buttons[buttonTotalSquared-1+buttonTotalSquared*x-x].configuration?.attributedTitle {
                    correct += 1
                }
            }
            if correct == buttonTotalSquared-1 {
                return getNextPlayer(currentCharacter: currentPlayer)
            }
        }
        
        
        return ""
        
    }
    
    
    internal func decideIfDraw() -> Bool {
        var draw = true
        for button in buttons {
            if button.configuration?.attributedTitle == "" {
                draw = false
            }
        }
        
        return draw
    }

    
}
