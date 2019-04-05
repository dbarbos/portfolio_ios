//
//  ViewController.swift
//  Coordinator
//
//  Created by Diler Barbosa on 26/02/19.
//  Copyright © 2019 T-Systems. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {

    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func storyBoardNavigateButtonTapped(_ sender: Any) {
        coordinator?.storyBoardNavigate()
    }
    
    @IBAction func xibadoButton(_ sender: Any) {
        coordinator?.xibado()
    }
    
    
}

