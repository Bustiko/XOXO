//
//  ViewController.swift
//  XOXO
//
//  Created by Buse Karabıyık on 21.01.2024.
//

import UIKit

class MainViewController: UIViewController {

    var uiFunctions = MainPageUIFunctions()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.99, green: 0.96, blue: 0.93, alpha: 1.00)
        uiFunctions.setupView(onView: view, target: self, action: #selector(buttonPressed))
        
        
        
    }
    
    @objc func buttonPressed(_ animated: Bool) {
        let destination = ResultPageViewController()
        destination.modalPresentationStyle = .fullScreen
        self.present(destination, animated: true)
    }
    
    
    

}

