//
//  APIPromise.swift
//  MobileAxxessCode
//
//  Created by RAJESH KUMAR on 26/07/20.
//  Copyright © 2020 RAJESH KUMAR. All rights reserved.
//

import Foundation
import PromiseKit
import Alamofire
import RealmSwift

extension Alamofire.URLRequestConvertible {
    func requestObject<T: Decodable>() -> Promise<T> {
        return Promise { seal in
          do {
            let request = try self.asURLRequest()
            APIManager.request(request).responseDecodable { (response: DataResponse<T, AFError>) in
                if let error = response.apiError {
                    seal.reject(error)
                } else {
                    do {
                        let value = try response.result.get()
                        seal.fulfill(value)
                    } catch (let error) {
                        seal.reject(error)
                    }
                }
            }
          } catch (let error) {
            seal.reject(error)
          }
        }
    }

}

