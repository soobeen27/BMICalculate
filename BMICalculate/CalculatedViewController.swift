//
//  CalculatedViewController.swift
//  BMICalculate
//
//  Created by Soo Jang on 2022/09/30.
//

import UIKit

final class CalculatedViewController: UIViewController {
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "BMI 결과값"
        label.font = .systemFont(ofSize: 25)
        
        return label
    }()
    
    private lazy var bmiLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 30)
        label.text = String(format: "%.2f", bmi!)
        return label
    }()
    
    private lazy var bmiView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.backgroundColor = bmiStatus(bmi: bmi!).1
        view.addSubview(bmiLabel)
        return view
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25)
        label.text = bmiStatus(bmi: bmi!).0
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [mainLabel, bmiView, statusLabel])
        st.spacing = 15
        st.alignment = .fill
        st.distribution = .fill
        st.axis = .vertical
        
        return st
    }()
    
    private lazy var reCalculateButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.setTitle("다시 계산하기", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.backgroundColor = .blue
        button.tintColor = .white
        button.addTarget(self, action: #selector(reCalculateButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var bmi: Float?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        setUI()
    }
    
    func setUI() {
        view.backgroundColor = .lightGray
        reCalculateButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        bmiView.translatesAutoresizingMaskIntoConstraints = false
        bmiLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        view.addSubview(reCalculateButton)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            stackView.widthAnchor.constraint(equalToConstant: 200),
            
            mainLabel.heightAnchor.constraint(equalToConstant: 30),
            bmiView.heightAnchor.constraint(equalToConstant: 80),
            bmiLabel.centerXAnchor.constraint(equalTo: bmiView.centerXAnchor),
            bmiLabel.centerYAnchor.constraint(equalTo: bmiView.centerYAnchor),
            
            statusLabel.heightAnchor.constraint(equalToConstant: 30),
            
            reCalculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            reCalculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            reCalculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            reCalculateButton.heightAnchor.constraint(equalToConstant: 45)
            
        ])
    }
    
    func bmiStatus(bmi: Float) -> (String, UIColor){
        var result: (String, UIColor)
        switch bmi {
        case 0..<18.5:
            result.0 = "저체중"
            result.1 = #colorLiteral(red: 0.4620248675, green: 0.8915500045, blue: 0.7595019937, alpha: 1)
        case 18.5..<23:
            result.0 = "정상"
            result.1 = #colorLiteral(red: 0.8530754447, green: 0.9590259194, blue: 0.310167104, alpha: 1)
        case 23..<25:
            result.0 = "과체중"
            result.1 = #colorLiteral(red: 1, green: 0.3877362609, blue: 0.5290305614, alpha: 1)
        case 25...:
            result.0 = "비만"
            result.1 = #colorLiteral(red: 1, green: 0.6181896329, blue: 0.5779290795, alpha: 1)
        default:
            result.0 = "이상함.."
            result.1 = .white
        }
        return result
    }

    @objc func reCalculateButtonTapped() {
        dismiss(animated: true)
    }

}

