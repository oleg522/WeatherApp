//
//  APIResponse.swift
//  WeatherApp
//
//  Created by Oleg Bakatin on 25/05/2019.
//  Copyright © 2019 Oleg Bakatin. All rights reserved.
//

import Foundation
import Alamofire

protocol APIResponse {
    var request: APIRequest { get }
}

extension APIResponse {
    
    func responseData(completionHandler: @escaping (_ responseData: Data?, _ error: NSError?) -> Void) {
        Alamofire.request(request.url, method: request.httpMethod, parameters: request.body, encoding: request.encoding, headers: request.header).responseData(completionHandler: { response in
            
            self.logRequest(with: response)
            
            if let error = response.error as NSError? {
                error.printError()
                completionHandler(nil, error)
            } else if let obj = response.result.value {
                completionHandler(obj, nil)
            }
        })
    }
    
    func logRequest(with response: DataResponse<Data>) {
        print(response.request as Any)
        print(self.request.url)
        print(self.request.httpMethod)
        if let body = self.request.body { print(body) }
        print(JSONEncoding.default)
        if let header = self.request.header { print(header)}
        if let code = response.response?.statusCode {
            print(code)
        }
    }
}
