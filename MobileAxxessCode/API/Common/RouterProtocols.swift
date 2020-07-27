//
//  RouterProtocols.swift
//  MobileAxxessCode
//
//  Created by RAJESH KUMAR on 26/07/20.
//  Copyright © 2020 RAJESH KUMAR. All rights reserved.
//

import Foundation
import PromiseKit

protocol BaseGithubUserRouter {
    func getGithubUser() -> Promise<[GithubUserModel]>
}
