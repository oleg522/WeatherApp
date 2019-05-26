//
//  Protocols.swift
//  WeatherApp
//
//  Created by Oleg Bakatin on 24/05/2019.
//  Copyright © 2019 Oleg Bakatin. All rights reserved.
//

import Foundation
import UIKit

protocol WeatherViewProtocol: class{
    func showWeather(weather: WeatherModel)
    func showError(message: String)
}

protocol WeatherPresenterProtocol: class{
    func viewDidLoad()
    func showDetail(weather: WeatherModel)
    func refresh()
}

protocol WeatherInteractorInputProtocol: class{
    func setWeather(weather: WeatherModel)
    func getWeather()
    func refresh()
}

protocol WeatherInteractorOutputProtocol: class{
    func reloadWeather(weather: WeatherModel)
    func showError(error: String)
}

protocol WeatherRouterProtocol: class {
    static func createWeatherModule() -> UIViewController
    func presentDetailScreen(from view: WeatherViewProtocol, for weather: WeatherModel)
}


