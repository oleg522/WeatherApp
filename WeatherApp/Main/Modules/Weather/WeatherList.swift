//
//  WeatherList.swift
//  WeatherApp
//
//  Created by Oleg Bakatin on 26/05/2019.
//  Copyright © 2019 Oleg Bakatin. All rights reserved.
//

import Foundation

struct WeatherList {
    
    var londonWeather: WeatherModel?
    var tokyoWeather: WeatherModel?
    var userLocalWeather: WeatherModel?
    
    mutating func addWeather(weather: WeatherModel) {
        switch weather.location {
        case Cities.london.rawValue: londonWeather = weather
        case Cities.tokyo.rawValue: tokyoWeather = weather
        default: userLocalWeather = weather
        }
    }
    
    mutating func clearAll() {
        londonWeather = nil
        tokyoWeather = nil
        userLocalWeather = nil
    }
}
