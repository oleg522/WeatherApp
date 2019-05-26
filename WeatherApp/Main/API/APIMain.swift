//
//  APIMain.swift
//  WeatherApp
//
//  Created by Oleg Bakatin on 25/05/2019.
//  Copyright © 2019 Oleg Bakatin. All rights reserved.
//

import Foundation

import Foundation
import Alamofire

extension API.Main: APIResponse {
    
    var request: APIRequest {
        switch self {
        case .getWeatherByCoordinates(let lat, let long):
            return APIRequest.createRequest(
                url: APIMainUrl.getWeatherByCoordinates.setup(),
                httpMethod: .get,
                body: APIBodyMain.setBody(for: .getWeatherByCoordinates(lat: lat, long: long)),
                encoding: URLEncoding.default)
        case .getWeatherByName(let name):
            return APIRequest.createRequest(
                url: APIMainUrl.getWeatherByName.setup(),
                httpMethod: .get,
                body: APIBodyMain.setBody(for: .getWeatherByName(name: name)),
                encoding: URLEncoding.default)
        }
    }
}
