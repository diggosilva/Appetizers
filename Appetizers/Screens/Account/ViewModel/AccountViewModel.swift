//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Diggo Silva on 24/01/24.
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

protocol AccountViewModelProtocol {
    var user: User? { get }
    
    func loadUser()
    func saveUser(name: String, lastName: String, email: String, birthday: Date, napkins: Bool, refill: Bool)
}

class AccountViewModel {
    
    let userKey = "UserKey"
    var user: User?
    
    func loadUser() {
        if let dataUser = UserDefaults.standard.data(forKey: userKey),
           let user = try? JSONDecoder().decode(User.self, from: dataUser) {
            self.user = user
        }
    }
    
    func saveUser(name: String, lastName: String, email: String, birthday: Date, napkins: Bool, refill: Bool) {
     let newUser = User(name: name, lastName: lastName, email: email, birthday: birthday, napkins: napkins, refill: refill)
        user = newUser
        
        if let data = try? JSONEncoder().encode(newUser) {
            UserDefaults.standard.setValue(data, forKey: userKey)
        }
    }
}
