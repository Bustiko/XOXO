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
        
        uiFunctions.setupView(onView: view)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let destination = ResultPageViewController()
        destination.modalPresentationStyle = .popover
        self.present(destination, animated: true)
    }
    
    
    

}

