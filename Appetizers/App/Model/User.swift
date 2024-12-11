//
//  User.swift
//  Appetizers
//
//  Created by Diggo Silva on 13/02/24.
//

import Foundation

class User: Codable {
    let name: String
    let lastName: String
    let email: String
    let birthday: Date
    let napkins: Bool
    let refill: Bool
    
    init(name: String, lastName: String, email: String, birthday: Date, napkins: Bool, refill: Bool) {
        self.name = name
        self.lastName = lastName
        self.email = email
        self.birthday = birthday
        self.napkins = napkins
        self.refill = refill
    }
}
