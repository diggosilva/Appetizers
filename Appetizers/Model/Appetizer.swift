//
//  Appetizer.swift
//  Appetizers
//
//  Created by Diggo Silva on 02/12/23.
//

import Foundation

// MARK: - Appetizer
struct AppetizerResponse: Codable {
    let request: [Appetizer]
}

// MARK: - Request
struct Appetizer: Codable {
    let price: Double
    let imageURL: String
    let id, calories: Int
    let name, description: String
    let protein, carbs: Int
}
