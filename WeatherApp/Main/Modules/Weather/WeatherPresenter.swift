//
//  WeatherPresenter.swift
//  WeatherApp
//
//  Created by Oleg Bakatin on 25/05/2019.
//  Copyright © 2019 Oleg Bakatin. All rights reserved.
//

import Foundation

class WeatherPresenter {
    weak var view: WeatherViewProtocol?
    var interactor: WeatherInteractorInputProtocol?
    var router: WeatherRouterProtocol?
    
    required init(view: WeatherViewProtocol) {
        self.view = view
    }
}

extension WeatherPresenter: WeatherPresenterProtocol {
    
    func showDetail(weather: WeatherModel) {
        guard let view = view else { return }
        router?.presentDetailScreen(from: view, for: weather)
    }
    
    func viewDidLoad() {
        interactor?.getWeather()
    }
    
    func refresh() {
        interactor?.refresh()
    }
}

extension WeatherPresenter: WeatherInteractorOutputProtocol {
    
    func reloadWeather(weather: WeatherModel) {
        view?.showWeather(weather: weather)
    }
    
    func showError(error: String) {
        view?.showError(message: error)
    }
}
