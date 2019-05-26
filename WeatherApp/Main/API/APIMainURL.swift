//
//  APIMainURL.swift
//  WeatherApp
//
//  Created by Oleg Bakatin on 25/05/2019.
//  Copyright © 2019 Oleg Bakatin. All rights reserved.
//

import Foundation

enum APIMainUrl {
    
    case getWeatherByCoordinates
    case getWeatherByName
    
    func setup() -> String {
        switch self {
        case .getWeatherByCoordinates:
            return "\(SERVER_URL)"
        case .getWeatherByName:
            return "\(SERVER_URL)"
        }
    }
}
