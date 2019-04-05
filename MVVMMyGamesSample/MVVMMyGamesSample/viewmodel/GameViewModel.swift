//
//  GameViewModel.swift
//  MVVMMyGamesSample
//
//  Created by Diler Barbosa on 05/04/19.
//  Copyright © 2019 T-Systems. All rights reserved.
//

import Foundation

class GameViewModel {
    let name: String
    let system: String
    let rate: Int
    
    //Injeção de Dependencia (DI)
    init(game: Game) {
        self.name = game.name
        self.system = game.system
        self.rate = game.rate > 5 ? 5 : (game.rate < 1 ? 0 : game.rate)
    }
}
