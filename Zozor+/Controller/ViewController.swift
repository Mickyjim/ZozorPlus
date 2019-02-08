//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!

    // MARK: - Action

    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (i, numberButton) in numberButtons.enumerated() {
            if sender == numberButton {
               // addNewNumber(i)
            }
        }
    }

    @IBAction func plus() {
       /* if canAddOperator {
        	operators.append("+")
        	stringNumbers.append("")
            updateDisplay()
        }*/
    }

    @IBAction func minus() {
      /*  if canAddOperator {
            operators.append("-")
            stringNumbers.append("")
            updateDisplay()
        } */
    }

    @IBAction func equal() {
       // calculateTotal()
    }
}
