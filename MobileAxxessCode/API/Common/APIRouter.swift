//
//  APIRouter.swift
//  MobileAxxessCode
//
//  Created by RAJESH KUMAR on 26/07/20.
//  Copyright © 2020 RAJESH KUMAR. All rights reserved.
//

import Alamofire

protocol APIRouter: URLRequestConvertible {
    var path: String { get }
    var parameters: [String: Any]? { get }
    var method: Alamofire.HTTPMethod { get }
    var headers: [String: String]? { get }
    var baseURL: String { get }
}

extension APIRouter {
    
    func asURLRequest() throws -> URLRequest {
        let parm = parameters
        var request =
            URLRequest(url: URL(string: baseURL)!.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        if let headers = headers {
            for (headerField, headerValue) in headers {
                request.setValue(headerValue, forHTTPHeaderField: headerField)
            }
        }
        
        do {
            var encoding: Alamofire.ParameterEncoding
            if method == .get {
                encoding = URLEncoding.default
            } else {
                encoding = JSONEncoding.default
            }
            request = try encoding.encode(request, with: parm)
        } catch {
            throw AFError.parameterEncodingFailed(
                reason: .jsonEncodingFailed(error: error))
        }
        return request
    }
    
    var parameters: [String: Any]? {
        return nil
    }
    
    var method: Alamofire.HTTPMethod {
        return .get
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var baseURL: String {
        if (APIManager.sharedInstance.isReachable) {
            return envBaseURL
        } else {
            return "http://mywebservice.com"
        }
    }
    
    var envBaseURL: String {
        return Environment.current.baseURL
    }

}

