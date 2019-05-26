//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Oleg Bakatin on 25/05/2019.
//  Copyright © 2019 Oleg Bakatin. All rights reserved.
//

import UIKit
import Kingfisher

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var temperature: UILabel!
    
    lazy var spinner: UIView = {
            let spinnerView = UIView.init(frame: bounds)
            spinnerView.backgroundColor = .clear
            return spinnerView
    }()
    
    var weather: WeatherModel? {
        didSet {
            guard let weather = weather else {return}
            location.text = weather.location
            temperature.text = weather.temperature + "°F"
            guard let iconURL = weather.icon else {return}
            let url = URL(string: Constants.imageDownloadURL + iconURL + ".png")
            icon.kf.setImage(with: url)
        }
    }
    
    func displaySpinner() {
        let ai = UIActivityIndicatorView(style: .gray)
        ai.startAnimating()
        ai.center = spinner.center
        DispatchQueue.main.async {
            self.spinner.addSubview(ai)
            self.addSubview(self.spinner)
        }
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            self.spinner.removeFromSuperview()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
