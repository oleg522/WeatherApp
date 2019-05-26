//
//  APIBodyMain.swift
//  WeatherApp
//
//  Created by Oleg Bakatin on 25/05/2019.
//  Copyright © 2019 Oleg Bakatin. All rights reserved.
//

import Foundation

enum MainBodyType {
    case getWeatherByCoordinates(lat: String, long: String)
    case getWeatherByName(name: String)
}

struct APIBodyMain {
    
    static func setBody(for type: MainBodyType) -> [String: AnyObject] {
        switch type {
        case .getWeatherByCoordinates(let lat, let long):
            return [
                "lat": lat as AnyObject,
                "lon": long as AnyObject,
                "appid": Constants.openWeatherKey
                ] as [String: AnyObject]
        case .getWeatherByName(let name):
            return [
                "q": name as AnyObject,
                "appid": Constants.openWeatherKey
                ] as [String: AnyObject]
        }
    }
}
