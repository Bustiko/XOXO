//
//  ResultPageViewController.swift
//  XOXO
//
//  Created by Buse Karabıyık on 22.01.2024.
//

import UIKit

class ResultPageViewController: UIViewController {
    
    let uiFunctions = ResultPageUIFunctions()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.99, green: 0.96, blue: 0.93, alpha: 1.00)
        uiFunctions.setupView(onView: view)
        
    }
    


}
