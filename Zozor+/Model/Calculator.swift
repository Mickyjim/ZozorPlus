//
//  Calculator.swift
//  CountOnMe
//
//  Created by Michael Favre on 08/02/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import Foundation

protocol AlertHandler {
    func displayAlert(message: String)
}

class Calculator {
    
    var alertHandlerDelegate: AlertHandler?
    
    // MARK: - Properties
    var stringNumbers: [String] = [String()]
    var operators: [String] = ["+"]
    var isExpressionCorrect: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                if stringNumbers.count == 1 {
                    alertHandlerDelegate?.displayAlert(message: "Démarrez un nouveau calcul !")
                } else {
                    alertHandlerDelegate?.displayAlert(message: "Entrez une expression correcte !")
                }
                return false
            }
        }
        return true
    }
    
    var canAddOperator: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                alertHandlerDelegate?.displayAlert(message: "Expression incorrecte !")
                return false
            }
        }
        return true
    }
    
    // MARK: - Methods
    
    func addNewNumber(_ newNumber: Int) -> String {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
        return updateDisplay()
    }
    
    func calculateTotal() -> String {
        if !isExpressionCorrect {
            return ""
        }
        
        var total = 0
        for (i, stringNumber) in stringNumbers.enumerated() {
            if let number = Int(stringNumber) {
                if operators[i] == "+" {
                    total += number
                } else if operators[i] == "-" {
                    total -= number
                }
            }
        }
    
        //textView.text = textView.text + "=\(total)"
        //clear()
        return String(total)
    }
    
    func plus() -> String {
        if canAddOperator {
            operators.append("+")
            stringNumbers.append("")
        }
        return updateDisplay()
    }
    
    func minus() -> String {
        if canAddOperator {
            operators.append("-")
            stringNumbers.append("")
        }
        return updateDisplay()
    }
    
    func updateDisplay() -> String {
        var text = ""
        for (i, stringNumber) in stringNumbers.enumerated() {
            
            // Add operator
            if i > 0 {
                text += operators[i]
            }
            
            // Add number
            text += stringNumber
        }
        return text
      
    }
    
    func clear() {
        stringNumbers = [String()]
        operators = ["+"]
    }
}
