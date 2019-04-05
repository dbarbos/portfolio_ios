//
//  Provider.swift
//  MVVMMyGamesSample
//
//  Created by Diler Barbosa on 05/04/19.
//  Copyright © 2019 T-Systems. All rights reserved.
//

import Foundation

class Provider {
    static let shared = Provider()
    private init() {}
    func fetchGames() -> [Game] {
        return [
                Game(name: "God of War", system: "PS4", rate: 5),
                Game(name: "Metal Gear Solid", system: "PS4", rate: 5),
                Game(name: "Super Mario Brothers", system: "Nintendo", rate: 4)
               ]
    }
}
