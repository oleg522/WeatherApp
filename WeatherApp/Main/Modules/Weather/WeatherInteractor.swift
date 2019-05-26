//
//  WeatherInteractor.swift
//  WeatherApp
//
//  Created by Oleg Bakatin on 25/05/2019.
//  Copyright © 2019 Oleg Bakatin. All rights reserved.
//

import Foundation
import CoreLocation

class WeatherInteractor {
    weak var presenter: WeatherInteractorOutputProtocol?
    let locationService: LocationServiceProtocol
    let apiService: APIServiceProtocol
    
    required init(presenter: WeatherInteractorOutputProtocol, locationService: LocationServiceProtocol, apiService: APIServiceProtocol) {
        self.presenter = presenter
        self.locationService = locationService
        self.apiService = apiService
        locationService.delegate = self
    }
    
    func getWeatherFromServer() {
        for city in Cities.allCases {
            apiService.getWeather(name: city.rawValue) { [weak self] weather, error in
                guard let weakSelf = self else { return }
                if let weather = weather {
                    weakSelf.presenter?.reloadWeather(weather: weather)
                } else if let error = error {
                    weakSelf.presenter?.showError(error: error)
                }
            }
        }
    }
}

extension WeatherInteractor: WeatherInteractorInputProtocol {
    
    func setWeather(weather: WeatherModel) {
        presenter?.reloadWeather(weather: weather)
    }
    
    func getWeather() {
        locationService.startUpdatingLocation()
        getWeatherFromServer()
    }
    
    func refresh() {
        locationService.refresh()
        getWeatherFromServer()
    }
}

extension WeatherInteractor: LocationDelegate {
    
    func setLocation(location: CLLocationCoordinate2D) {
        let lat = location.latitude.toString()
        let long = location.longitude.toString()
        apiService.getWeather(lat: lat, long: long) { [weak self] weather, error in
            guard let weakSelf = self else { return }
            if let weather = weather {
                weakSelf.presenter?.reloadWeather(weather: weather)
            } else if let error = error {
                weakSelf.presenter?.showError(error: error)
            }
        }
    }
}
