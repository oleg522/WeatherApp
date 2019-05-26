//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Oleg Bakatin on 24/05/2019.
//  Copyright © 2019 Oleg Bakatin. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: WeatherPresenterProtocol?
    var loading = false
    var weatherList = WeatherList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        presenter?.viewDidLoad()
        loading = true
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func refresh(_ sender: Any) {
        presenter?.refresh()
        weatherList.clearAll()
        loading = true
        tableView.reloadData()
    }
}

extension WeatherViewController: WeatherViewProtocol{
    
    func showWeather(weather: WeatherModel) {
        weatherList.addWeather(weather: weather)
        loading = false
        tableView.reloadData()
    }
    
    func showError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in }))
        self.present(alert, animated: true, completion: nil)
        loading = false
        tableView.reloadData()
    }
}


