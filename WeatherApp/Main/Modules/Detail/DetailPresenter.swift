//
//  DetailPresenter.swift
//  WeatherApp
//
//  Created by Oleg Bakatin on 26/05/2019.
//  Copyright © 2019 Oleg Bakatin. All rights reserved.
//

import Foundation

class DetailPresenter {
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var router: DetailRouterProtocol?
    
    required init(view: DetailViewProtocol) {
        self.view = view
    }
}

extension DetailPresenter: DetailPresenterProtocol {
}

extension DetailPresenter: DetailInteractorOutputProtocol {
}
