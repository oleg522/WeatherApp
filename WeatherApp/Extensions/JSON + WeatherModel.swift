//
//  JSON + WeatherModel.swift
//  WeatherApp
//
//  Created by Oleg Bakatin on 26/05/2019.
//  Copyright © 2019 Oleg Bakatin. All rights reserved.
//

import Foundation
import SwiftyJSON

extension JSON {
    
    func convertToWeatherModel()-> WeatherModel {
        let name = self["name"].stringValue
        let temp = String(self["main"]["temp"].intValue)
        let array = self["weather"].arrayValue
        let icon = !array.isEmpty ? array[0]["icon"].stringValue : nil
        let cloud = String(self["clouds"]["all"].intValue)
        let wind = String(self["wind"]["speed"].doubleValue)
        return WeatherModel(location: name, temperature: temp, icon: icon,cloud: cloud, wind: wind)
    }
}
