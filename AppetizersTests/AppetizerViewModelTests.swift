//
//  AppetizerViewModelTests.swift
//  AppetizersTests
//
//  Created by Diggo Silva on 12/12/24.
//

import XCTest
@testable import Appetizers

class mockSuccess: ServiceProtocol {
    func isUpdating() -> Bool {
        return false
    }
    
    func getAppetizers(onSuccess: @escaping ([Appetizer], RequestWay) -> Void, onError: @escaping (Error) -> Void) {
        onSuccess([
            Appetizer(price: 1.23, imageURL: "", id: 0, calories: 0, name: "Pizza", description: "", protein: 0, carbs: 0),
        ], .online)
    }
}

class mockFailure: ServiceProtocol {
    func isUpdating() -> Bool {
        return false
    }
    
    func getAppetizers(onSuccess: @escaping ([Appetizer], RequestWay) -> Void, onError: @escaping (Error) -> Void) {
        onError(NSError())
    }
}

final class AppetizerViewModelTests: XCTestCase {
    func testWhenSuccess() {
        let sut = AppetizerViewModel(service: mockSuccess())
        
        sut.state.bind { state in
            XCTAssertTrue(state == .loaded)
        }
        
        sut.requestWay.bind { requestWay in
            XCTAssertTrue(requestWay == .online)
        }
        sut.loadData()
        
        let rowsInSection = sut.numberOfRows()
        XCTAssertEqual(rowsInSection, 1)
        
        let firstAppetizer = sut.getAppetizer(of: IndexPath(row: 0, section: 0))
        XCTAssertEqual(firstAppetizer.name, "Pizza")
    }
    
    func testWhenFailure() {
        let sut = AppetizerViewModel(service: mockFailure())
        
        sut.state.bind { state in
            XCTAssertTrue(state == .error)
        }
        
        sut.requestWay.bind { requestWay in
            XCTAssertTrue(requestWay == .unknown)
        }
        sut.loadData()
    }
}
