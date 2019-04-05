//
//  MainCoordinator.swift
//  Coordinator
//
//  Created by Diler Barbosa on 26/02/19.
//  Copyright © 2019 T-Systems. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator, StoryBoardNavigating {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func storyBoardNavigate() {
        let vc = StoryBoardNavigateController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func xibado() {
        let vc = XibViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
}


