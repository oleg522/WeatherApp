//
//  AlamofireService.swift
//  WeatherApp
//
//  Created by Oleg Bakatin on 25/05/2019.
//  Copyright © 2019 Oleg Bakatin. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

protocol APIServiceProtocol: class{
    func getWeather(lat: String, long: String, completion: @escaping (WeatherModel?, String?) -> Void)
    func getWeather(name: String, completion: @escaping (WeatherModel?, String?) -> Void)
}

class APIService: NSObject, APIServiceProtocol{
    
    func getWeather(lat: String, long: String, completion: @escaping (WeatherModel?, String?) -> Void) {
        API.Main.getWeatherByCoordinates(lat: lat, long: long).responseData { (data, error) in
            if let error = error {
                completion(nil, error.localizedDescription)
            } else if let data = data {
                let json = JSON(data)
                print(json)
                let weather = json.convertToWeatherModel()
                completion(weather, nil)
            } else {
                completion(nil, "Json error")
            }
        }
    }
    
    func getWeather(name: String, completion: @escaping (WeatherModel?, String?) -> Void) {
        API.Main.getWeatherByName(name: name).responseData { (data, error) in
            if let error = error {
                completion(nil, error.localizedDescription)
            } else if let data = data {
                let json = JSON(data)
                print(json)
                let weather = json.convertToWeatherModel()
                completion(weather, nil)
            } else {
                completion(nil, "Json error")
            }
        }
    }
}
