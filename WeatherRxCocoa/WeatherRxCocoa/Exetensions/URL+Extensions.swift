//
//  URL+Extensions.swift
//  WeatherRxCocoa
//
//  Created by Diler Barbosa on 07/04/19.
//  Copyright © 2019 T-Systems. All rights reserved.
//

import Foundation

extension URL {
    static func urlForWeatherAPI(cidade: String) -> URL? {
        return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cidade)&APPID=176a08ba0c82b351fa673661a5d21b4a&units=imperial")
    }
}
