//
//  API.swift
//  WeatherApp
//
//  Created by Oleg Bakatin on 25/05/2019.
//  Copyright © 2019 Oleg Bakatin. All rights reserved.
//

import Foundation

class API {
    
    enum Main {
        case getWeatherByCoordinates(lat: String, long: String)
        case getWeatherByName(name: String)
    }
}
