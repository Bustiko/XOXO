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
        
        Variables.container.font = UIFont(name: "Chalkduster", size: 50)
        
        currentPlayer = AttributedString("X", attributes: Variables.container)
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
        
        if currentCharacter == AttributedString("X", attributes: Variables.container) {
            return AttributedString("O", attributes: Variables.container)
        }else {
            return AttributedString("X", attributes: Variables.container)
        }
        
    }
    
    internal mutating func decideChampion() -> AttributedString {
        
        // horizantol win
        for row in 0..<Variables.buttonTotalSquared {
            correct = 0
            let startIndex = row * Variables.buttonTotalSquared
            if let title = Variables.buttons[startIndex].configuration?.attributedTitle,
               title != "" {
                for x in 1...Variables.buttonTotalSquared-1 {
                    if title == Variables.buttons[startIndex + x].configuration?.attributedTitle {
                        correct += 1
                    }
                }
                if correct == Variables.buttonTotalSquared-1 {
                    return getNextPlayer(currentCharacter: currentPlayer)
                }
            }
        }
        
        //vertical win
        for col in 0..<Variables.buttonTotalSquared {
            correct = 0
            if let title = Variables.buttons[col].configuration?.attributedTitle,
               title != "" {
                for x in 1..<Variables.buttonTotalSquared {
                    if title == Variables.buttons[col + x*Variables.buttonTotalSquared].configuration?.attributedTitle {
                        correct += 1
                    }
                }
                if correct == Variables.buttonTotalSquared-1 {
                    return getNextPlayer(currentCharacter: currentPlayer)
                }
            }
        }
        
        //diagonal win
        if let title = Variables.buttons[0].configuration?.attributedTitle,
           title != "" {
            correct = 0
            for x in 1..<Variables.buttonTotalSquared {
                if title == Variables.buttons[Variables.buttonTotalSquared*x + x].configuration?.attributedTitle {
                    correct += 1
                }
            }
            if correct == Variables.buttonTotalSquared-1 {
                return getNextPlayer(currentCharacter: currentPlayer)
            }
         }
            
        if let title = Variables.buttons[Variables.buttonTotalSquared-1].configuration?.attributedTitle,
           title != "" {
            correct = 0
            for x in 1..<Variables.buttonTotalSquared {
                if title == Variables.buttons[Variables.buttonTotalSquared-1+Variables.buttonTotalSquared*x-x].configuration?.attributedTitle {
                    correct += 1
                }
            }
            if correct == Variables.buttonTotalSquared-1 {
                return getNextPlayer(currentCharacter: currentPlayer)
            }
        }
        
        
        return ""
        
    }
    
    
    internal func decideIfDraw() -> Bool {
        var draw = true
        for button in Variables.buttons {
            if button.configuration?.attributedTitle == "" {
                draw = false
            }
        }
        
        return draw
    }

    
}
