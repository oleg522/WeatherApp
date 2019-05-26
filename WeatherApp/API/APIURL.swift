//
//  APIURL.swift
//  WeatherApp
//
//  Created by Oleg Bakatin on 25/05/2019.
//  Copyright © 2019 Oleg Bakatin. All rights reserved.
//

import Foundation

enum ServerType: String {
    case debuge = "https://api.openweathermap.org/data/2.5/weather?"
    case release = ""
}

#if DEBUG
let SERVER_URL = "\(ServerType.debuge.rawValue)"
#else
let SERVER_URL = "\(ServerType.debuge.rawValue)"
#endif
