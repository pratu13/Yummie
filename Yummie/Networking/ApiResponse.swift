//
//  ApiResponse.swift
//  Yummie
//
//  Created by Pratyush  on 10/29/21.
//

import UIKit

struct ApiResponse<T: Codable> : Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
