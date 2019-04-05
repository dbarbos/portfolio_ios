//
//  Game.swift
//  MVVMMyGamesSample
//
//  Created by Diler Barbosa on 05/04/19.
//  Copyright © 2019 T-Systems. All rights reserved.
//

import Foundation

struct Game : Decodable {
    let name: String
    let system: String
    let rate: Int
}
