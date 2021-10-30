//
//  Route.swift
//  Yummie
//
//  Created by Pratyush  on 10/27/21.
//

import UIKit

enum Route {
    static let baseURL = "https://yummie.glitch.me"
    
    case temp
    
    var description: String {
        switch self {
        case .temp:
            return "/dish-categories"
        }
    }
}
