//
//  APIRequest.swift
//  WeatherApp
//
//  Created by Oleg Bakatin on 25/05/2019.
//  Copyright © 2019 Oleg Bakatin. All rights reserved.
//

import Foundation
import Alamofire

struct APIRequest {
    
    let url: String
    let httpMethod: HTTPMethod
    let body: [String: AnyObject]?
    let header: HTTPHeaders?
    let imageData: [String: Data]?
    let encoding: ParameterEncoding
    
    static func createRequest(url: String, httpMethod: HTTPMethod, body: [String: AnyObject]? = nil, header: HTTPHeaders? = nil, imageData: [String: Data]? = nil, encoding: ParameterEncoding = JSONEncoding.default, path: String = "") -> APIRequest {
        return self.init(url: url + path, httpMethod: httpMethod, body: body, header: header, imageData: imageData, encoding: encoding)
    }
}
