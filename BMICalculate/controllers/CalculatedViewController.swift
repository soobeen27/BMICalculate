//
//  CalculatedViewController.swift
//  BMICalculate
//
//  Created by Soo Jang on 2022/09/30.
//

import UIKit

final class CalculatedViewController: UIViewController {
    var bmi = BMI()
    let calculatedView = CalculatedView()
    
    override func loadView() {
        view = calculatedView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAddTarget()
        setUpBMIInfo()
    }
    
    func setUpBMIInfo() {
        calculatedView.bmiLabel.text = String(format: "%.2f",bmi.value)
        calculatedView.bmiView.backgroundColor = bmi.color
        calculatedView.statusLabel.text = bmi.status
    }
    
    func setUpAddTarget() {
        calculatedView.reCalculateButton.addTarget(self, action: #selector(reCalculateButtonTapped), for: .touchUpInside)
    }

    @objc func reCalculateButtonTapped() {
        dismiss(animated: true)
    }

}

