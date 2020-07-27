//
//  APIManager.swift
//  MobileAxxessCode
//
//  Created by RAJESH KUMAR on 26/07/20.
//  Copyright © 2020 RAJESH KUMAR. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
    static var sharedInstance = APIManager()
    fileprivate let networkManager: Alamofire.Session
    fileprivate let queue = OperationQueue()
    fileprivate let group = DispatchGroup()
    fileprivate let reachability = Alamofire.NetworkReachabilityManager()
    var isReachable: Bool {
        return reachability?.isReachable != false
    }
    
    init() {
        queue.maxConcurrentOperationCount = 1
        let configuration = URLSessionConfiguration.default
        networkManager = Alamofire.Session(configuration: configuration, startRequestsImmediately: false)
        reachability?.startListening(onUpdatePerforming: { (reachabilityStatus) in
            print("reachabilityStatus: \(reachabilityStatus)")
        })
    }
}

extension APIManager {
    func request(_ URLRequest: URLRequestConvertible) -> DataRequest {
        let request = networkManager.request(URLRequest).responseData { _ in
            (self.group).leave()
        }
        
        queue.addOperation {
            self.group.enter()
            request.resume()
            _ = self.group.wait(timeout: DispatchTime.distantFuture)
        }
        
        return request
    }
    
    class func request(_ URLRequest: URLRequestConvertible) -> DataRequest {
      return APIManager.sharedInstance.request(URLRequest)
    }
}

