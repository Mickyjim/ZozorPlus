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
    
    func testGivenIsExpressionCorrect_WhenStringNumbersIsEmpty_ThenShouldReturnFalse() {
        XCTAssertFalse(calculator.isExpressionCorrect)
    }

    func testGivenIsExpressionCorrect_WhenStringNumbersContainsValues_ThenShouldReturnFalse() {
        let _ = calculator.addNewNumber(1)
        let _ = calculator.plus()
        XCTAssertFalse(calculator.isExpressionCorrect)
    }
    
    func testGivenCanAddOperator_WhenStringNumbersContainsAValue_ThenShouldReturnTrue() {
        let _ = calculator.addNewNumber(1)
        XCTAssertTrue(calculator.isExpressionCorrect)
    }
    
    func testGivenCalculateTotal_WhenCalculationIsCorrect_ThenShouldGiveACorrectResult() {
        let _ = calculator.addNewNumber(1)
        let _ = calculator.minus()
        let _ = calculator.addNewNumber(1)
        XCTAssertEqual(calculator.calculateTotal(), "0.0")
    }
    
    func testGivenCalculateTotal_WhenCalculationIsIncorrect_ThenShouldGiveAIncorrectResult() {
        let _ = calculator.addNewNumber(1)
        let _ = calculator.minus()
        XCTAssertEqual(calculator.calculateTotal(), "")
    }
    
    func testGivenRadius_WhenCalculationIsCorrect_ThenShouldGiveACorrectResult() {
        let _ = calculator.addNewNumber(16)
        let _ = calculator.radius()
        XCTAssertEqual(calculator.calculateTotal(), "4.0")
    }

    func testGivenRadius_WhenCalculationIsIncorrect_ThenShouldGiveAIncorrectResult() {
        let _ = calculator.addNewNumber(16)
        let _ = calculator.plus()
        let radius = calculator.radius()
        XCTAssertEqual(radius, "16+")
    }
}
