//
//  CalculatorTests.swift
//  CountOnMeTests
//
//  Created by Michael Favre on 22/02/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CalculatorTests: XCTestCase {

    var calculator: Calculator!
    
    override func setUp() {
        calculator = Calculator()
    }
    
    func testGivenCanAddOperator_WhenStringNumbersIsEmpty_ThenShouldReturnFalse() {
        XCTAssertFalse(calculator.canAddOperator)
    }

    func testGivenCanAddOperator_WhenStringNumbersIsNotEmpty_ThenShouldReturnTrue() {
        
        let _ = calculator.addNewNumber(1)
        XCTAssertTrue(calculator.canAddOperator)
    }
}
