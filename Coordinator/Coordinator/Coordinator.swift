//
//  Coordinator.swift
//  Coordinator
//
//  Created by Diler Barbosa on 26/02/19.
//  Copyright © 2019 T-Systems. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
    
}

protocol StoryBoardNavigating: AnyObject {
    func storyBoardNavigate()
}
