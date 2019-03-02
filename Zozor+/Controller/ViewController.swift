//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var calculate = Calculator()
    
    // MARK: - Outlets

    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!

    // MARK: - Action

    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let buttonTitle = sender.title(for: .normal) else {return}
        guard let number = Int(buttonTitle) else {return}
        textView.text = calculate.addNewNumber(number)
    }

    @IBAction func operatorTapped(_ sender: UIButton) {
        switch sender.title(for: .normal) {
        case "+":
            textView.text = calculate.plus()
        case "-":
            textView.text = calculate.minus()
        case "√":
            textView.text = calculate.squareRoot()
        case "=":
            textView.text = calculate.calculateTotal()
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculate.alertHandlerDelegate = self
    }
}
    // Extension

extension ViewController: AlertHandler {
    func displayAlert(message: String) {
        let alertVC = UIAlertController(title: "Ooopppsss!", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
    
    
}
