//
//  ViewController.swift
//  XOXO
//
//  Created by Buse Karabıyık on 21.01.2024.
//

import UIKit

class MainViewController: UIViewController {

    var uiFunctions = MainPageUIFunctions()
    var gameLogicModel = GameLogicModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiFunctions.setupView(onView: view, target: self, action: #selector(buttonPressed))
        uiFunctions.label.text = String(gameLogicModel.currentPlayer.characters) + "'s TURN"
        gameLogicModel.createAttributedString()
        
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        gameLogicModel.processPressLogic(forButton: sender, currentPlayer: gameLogicModel.currentPlayer)
        uiFunctions.label.text = String(gameLogicModel.currentPlayer.characters) + "'s TURN"
        
        let winner = gameLogicModel.decideChampion()
        let isDraw = gameLogicModel.decideIfDraw()
    
        if winner != "" || isDraw == true {
            let destination = ResultPageViewController()
            destination.modalPresentationStyle = .fullScreen
            destination.view.accessibilityIdentifier = "ResultPageView"
            
            if isDraw == true {
                destination.uiFunctions.label.text = "DRAW"
            }else {
                destination.uiFunctions.label.text = String(winner.characters) + " WINS"
                
            }
            
            self.present(destination, animated: true)
        }

        
    }
    
    
    

}

