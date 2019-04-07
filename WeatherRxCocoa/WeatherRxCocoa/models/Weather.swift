//
//  Weather.swift
//  WeatherRxCocoa
//
//  Created by Diler Barbosa on 07/04/19.
//  Copyright © 2019 T-Systems. All rights reserved.
//

import Foundation

struct WeatherResult: Decodable {
    let main: Weather
}

extension WeatherResult {
    static var empty: WeatherResult {
        return WeatherResult(main: Weather(temp: 0.0, humidity: 0.0))
    }
}


struct Weather: Decodable {
    let temp: Double
    let humidity: Double
}
