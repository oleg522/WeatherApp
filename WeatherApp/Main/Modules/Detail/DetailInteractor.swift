//
//  DetailInteractor.swift
//  WeatherApp
//
//  Created by Oleg Bakatin on 26/05/2019.
//  Copyright © 2019 Oleg Bakatin. All rights reserved.
//

import Foundation

class DetailInteractor {
    
    weak var presenter: DetailInteractorOutputProtocol?
    
    required init(presenter: DetailInteractorOutputProtocol) {
        self.presenter = presenter
    }
}

extension DetailInteractor: DetailInteractorInputProtocol {
    
}
