//
//  WeatherViewController + TableViewDataSource.swift
//  WeatherApp
//
//  Created by Oleg Bakatin on 25/05/2019.
//  Copyright © 2019 Oleg Bakatin. All rights reserved.
//

import Foundation
import UIKit

extension WeatherViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherTableViewCell else {
            return UITableViewCell()
        }
        switch indexPath.row {
        case 0: do {
                cell.weather = weatherList.userLocalWeather
            }
        case 1: do {
            cell.weather = weatherList.londonWeather
            }
        case 2: do {
            cell.weather = weatherList.tokyoWeather
            }
        default: break
        }
        if loading && cell.weather == nil {
            cell.displaySpinner()
        } else {
            cell.removeSpinner()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let weather: WeatherModel?
        switch indexPath.row {
        case 0: weather = weatherList.userLocalWeather
        case 1: weather = weatherList.londonWeather
        case 2: weather = weatherList.tokyoWeather
        default: return
        }
        guard let unwrappedWeather = weather else {return}
        presenter?.showDetail(weather: unwrappedWeather)
    }
}
