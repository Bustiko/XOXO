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

        uiFunctions.setupView(onView: view)
        view.backgroundColor = .white
    }
    


}
