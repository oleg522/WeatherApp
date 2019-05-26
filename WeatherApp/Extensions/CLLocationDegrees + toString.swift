//
//  CLLocationDegrees + toString.swift
//  WeatherApp
//
//  Created by Oleg Bakatin on 25/05/2019.
//  Copyright © 2019 Oleg Bakatin. All rights reserved.
//

import Foundation
import CoreLocation

extension CLLocationDegrees {

    func toString()-> String {
        return String(Int(self))
    }
}
