//
//  Dish.swift
//  Yummie
//
//  Created by Pratyush  on 10/22/21.
//

import UIKit

struct Dish {
    let id,name,description, image: String?
    let calories: Double?
    
    var formattedCalories: String {
        return String(format: "%0.2f calories", calories ?? 0.0)
    }
    
    
}
