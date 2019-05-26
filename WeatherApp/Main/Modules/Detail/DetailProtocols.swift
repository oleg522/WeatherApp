//
//  DetailProtocols.swift
//  WeatherApp
//
//  Created by Oleg Bakatin on 26/05/2019.
//  Copyright © 2019 Oleg Bakatin. All rights reserved.
//

import Foundation
import UIKit

protocol DetailViewProtocol: class{
}

protocol DetailPresenterProtocol: class{
}

protocol DetailInteractorInputProtocol: class{
}

protocol DetailInteractorOutputProtocol: class{
}

protocol DetailRouterProtocol: class {
    static func createDetailRouterModule(with weather: WeatherModel) -> UIViewController
}



