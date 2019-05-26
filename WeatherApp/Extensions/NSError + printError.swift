//
//  NSError + printError.swift
//  WeatherApp
//
//  Created by Oleg Bakatin on 25/05/2019.
//  Copyright © 2019 Oleg Bakatin. All rights reserved.
//

import Foundation

extension NSError {
    
    func printError() {
        print("‼️ Error code: \(self.code)")
        switch self.code {
        case 300...308:
            print("Redirection Error ‼️")
        case 400:
            print("Bad Request Error ‼️")
        case 401:
            print("Unauthorized Error ‼️")
        case 402:
            print("Payment Required Error ‼️")
        case 403:
            print("Not enough permissions to perform this action Error ‼️")
        case 404:
            print("Client not found Error ‼️")
        case 405...420:
            print("Some Client Error ‼️")
        case 422:
            print("Error: \(self.localizedDescription) ‼️")
        case 423...499:
            print("Some Client Error ‼️")
        case 500...599:
            print("Some Server Error ‼️")
        default:
            print("Unknown Error ‼️")
        }
    }
}
