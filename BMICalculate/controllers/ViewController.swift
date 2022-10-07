//
//  ViewController.swift
//  BMICalculate
//
//  Created by Soo Jang on 2022/09/30.
//

import UIKit

final class ViewController: UIViewController {
    
    var bmiCalculator = BMICalculateManager()
    private let firstView = FirstView()
    
    override func loadView() {
        view = firstView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAddTarget()
    }
    
    func setUpAddTarget() {
        firstView.calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
    }
       
    @objc func calculateButtonTapped() {
        let nextVC = CalculatedViewController()
        
        guard let h = firstView.heightTextField.text, let w = firstView.weightTextField.text else {return}
        guard let h2 = Int(h), let w2 = Int(w) else {return}

        nextVC.bmi = bmiCalculator.getBMI(height: h2, weight: w2)
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true)
    }
}


