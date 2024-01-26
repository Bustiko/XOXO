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
        
        
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        
        gameLogicModel.processPressLogic(forButton: sender, currentPlayer: gameLogicModel.currentPlayer)
        let winner = gameLogicModel.decideChampion()
        let isDraw = gameLogicModel.decideIfDraw()
        print(winner)
        print(isDraw)
        
        if winner != "" || isDraw == true {
            let destination = ResultPageViewController()
            destination.modalPresentationStyle = .fullScreen
            destination.view.accessibilityIdentifier = "ResultPageView"
            self.present(destination, animated: true)
        }

        
    }
    
    
    

}

