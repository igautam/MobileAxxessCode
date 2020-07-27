//
//  APIError.swift
//  MobileAxxessCode
//
//  Created by RAJESH KUMAR on 26/07/20.
//  Copyright © 2020 RAJESH KUMAR. All rights reserved.
//

import Alamofire

extension Alamofire.DataResponse {
    var apiError: NSError? {
        if let error = NSError(apiData: data,
                               statusCode: response?.statusCode ?? -1) {
            return error
        }
        return networkError
    }
    
    var networkError: NSError? {
        if let statusCode = response?.statusCode {
            if (400..<500).contains(statusCode) {
                return NSError(domain: "com.mobileaxesscode.api",
                               code: statusCode,
                               userInfo:
                    [NSLocalizedDescriptionKey: "Client Error \(statusCode)"])
            }
            if (500..<600).contains(statusCode) {
                return NSError(domain: "com.mobileaxesscode.api", code: statusCode,
                               userInfo:
                    [NSLocalizedDescriptionKey: "Server Error \(statusCode)"])
            }
        }
        
        switch result {
        case .failure(let error):
            if let error = error as? AFError,
                error.isResponseSerializationError,
                let data = data,
                let message = String(data: data, encoding: .utf8) {
                return NSError(domain: "com.mobileaxesscode.api",
                               code: -1,
                               userInfo: [NSLocalizedDescriptionKey: message])
            } else {
                return error as NSError?
            }
        case .success(_):
            return nil
        }
    }
}

extension NSError {
    
    convenience init?(apiData: Data?, statusCode: Int) {
        guard let _ = apiData else {
            return nil
        }
        //Map Error as per business logic for error handling like
        return nil
    }
}

