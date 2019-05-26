//
//  WeatherRouter.swift
//  WeatherApp
//
//  Created by Oleg Bakatin on 25/05/2019.
//  Copyright © 2019 Oleg Bakatin. All rights reserved.
//

import Foundation
import UIKit

class WeatherRouter {
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}

extension WeatherRouter: WeatherRouterProtocol {
    
    static func createWeatherModule() -> UIViewController {
        guard let navController = storyboard.instantiateViewController(withIdentifier: "WeatherNavigationVC") as? UINavigationController else { fatalError("Invalid View Controller")}
        guard let viewController = navController.topViewController as? WeatherViewController else { fatalError("Invalid View Controller") }
        let presenter = WeatherPresenter(view: viewController)
        let interactor = WeatherInteractor(presenter: presenter, locationService: LocationService(), apiService: APIService())
        let router = WeatherRouter()
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        return navController
    }
    
    func presentDetailScreen(from view: WeatherViewProtocol, for weather: WeatherModel) {
        let detailVC = DetailRouter.createDetailRouterModule(with: weather)
        guard let viewVC = view as? UIViewController else {
            fatalError("Invalid View Protocol type")
        }
        viewVC.navigationController?.pushViewController(detailVC, animated: true)
    }
}
