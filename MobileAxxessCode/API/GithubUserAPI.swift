//
//  GithubUserAPI.swift
//  MobileAxxessCode
//
//  Created by RAJESH KUMAR on 26/07/20.
//  Copyright © 2020 RAJESH KUMAR. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

enum GithubUserAPI: APIRouter {
    case getUser
    case none
    
    var path: String {
        switch self {
        case .getUser:
            return "/AxxessTech/Mobile-Projects/master/challenge.json"
        case .none:
            return ""
        }
    }
}

struct GithubUserRouter: BaseGithubUserRouter {
    func getGithubUser() -> Promise<[GithubUserModel]> {
        return GithubUserAPI.getUser.requestObject()
    }
}

