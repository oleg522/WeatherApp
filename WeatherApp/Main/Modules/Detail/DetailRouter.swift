//
//  DetailRouter.swift
//  WeatherApp
//
//  Created by Oleg Bakatin on 26/05/2019.
//  Copyright © 2019 Oleg Bakatin. All rights reserved.
//

import Foundation

import Foundation
import UIKit

class DetailRouter {
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}

extension DetailRouter: DetailRouterProtocol {
    
    static func createDetailRouterModule(with weather: WeatherModel) -> UIViewController {
        
        guard let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            fatalError("Invalid view controller type")
        }
        let presenter = DetailPresenter(view: detailVC)
        let interactor = DetailInteractor(presenter: presenter)
        let router = DetailRouter()
        detailVC.presenter = presenter
        detailVC.weather = weather
        presenter.interactor = interactor
        presenter.router = router
        
        return detailVC
    }
}
