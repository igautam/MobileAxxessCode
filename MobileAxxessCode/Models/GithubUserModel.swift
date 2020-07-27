//
//  GithubUserModel.swift
//  MobileAxxessCode
//
//  Created by RAJESH KUMAR on 26/07/20.
//  Copyright © 2020 RAJESH KUMAR. All rights reserved.
//

import Foundation
import RealmSwift


class GithubUserModel: Object, Decodable {
    @objc dynamic var userId: String?
    @objc dynamic var userType: String?
    @objc dynamic var date: String?
    @objc dynamic var userData: String?

    
    enum CodingKeys: String, CodingKey {
        case userId = "id", userType = "type",
        date = "date", userData = "data"
    }
}
