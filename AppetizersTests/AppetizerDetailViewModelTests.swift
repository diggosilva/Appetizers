//
//  AppetizerDetailViewModelTests.swift
//  AppetizersTests
//
//  Created by Diggo Silva on 13/12/24.
//

import XCTest
@testable import Appetizers

final class AppetizerDetailViewModelTests: XCTestCase {
    func testAddAppetizer() {
        let appetizer = Appetizer(price: 0.0, imageURL: "", id: 0, calories: 0, name: "Pizza", description: "", protein: 0, carbs: 0)
        
        let sut = AppetizerDetailViewModel(appetizer: appetizer)
        sut.addAppetizer()
        XCTAssertEqual(appetizer.name, "Pizza")
    }
}
