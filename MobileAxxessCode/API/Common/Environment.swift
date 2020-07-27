//
//  Environment.swift
//  MobileAxxessCode
//
//  Created by RAJESH KUMAR on 26/07/20.
//  Copyright © 2020 RAJESH KUMAR. All rights reserved.
//

import Foundation

enum Environment : String {
    
    case dev = "Debug"
    case qa = "QA"
    case prod = "Production"
    
    static var current: Environment {
        if let value = Bundle.main.object(forInfoDictionaryKey: "Environment") as? String,
            let env = Environment(rawValue: value) {
            return env
        }
        return .qa
    }
    
    var baseURL: String {
        switch self {
        case .dev, .qa:
            return "https://raw.githubusercontent.com"
        case .prod:
            return "https://raw.githubusercontent.com"
        }
    }
    
    var pushNotificationsEnabled: Bool {
        switch self {
        case .dev, .qa:
            return true
        case .prod:
            return true
        }
    }
}
