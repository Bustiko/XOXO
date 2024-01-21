//
//  ViewController.swift
//  XOXO
//
//  Created by Buse Karabıyık on 21.01.2024.
//

import UIKit

class MainPageViewController: UIViewController {
    
    var uiFunctions = MainPageUIFunctions()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiFunctions.setupView(onView: view)

    }
    
    
    


}
