//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Oleg Bakatin on 24/05/2019.
//  Copyright © 2019 Oleg Bakatin. All rights reserved.
//

import Foundation
import UIKit

class WeatherModel {
    
    let location: String
    let temperature: String
    let icon: String?
    let cloud: String
    let wind: String
    
    init(location: String, temperature: String, icon: String?, cloud: String, wind: String) {
        self.location = location
        self.temperature = temperature
        self.icon = icon
        self.cloud = cloud
        self.wind = wind
    }
}


