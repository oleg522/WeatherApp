//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by Oleg Bakatin on 26/05/2019.
//  Copyright © 2019 Oleg Bakatin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var presenter: DetailPresenterProtocol?
    
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var cloudsLbl: UILabel!
    @IBOutlet weak var windLbl: UILabel!
    
    var weather: WeatherModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let weather = weather else {return}
        locationLbl.text = weather.location
        cloudsLbl.text = weather.cloud + "%"
        windLbl.text = weather.wind + "mph"
        // Do any additional setup after loading the view.
    }
}

extension DetailViewController: DetailViewProtocol {
    
}
