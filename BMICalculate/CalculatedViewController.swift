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
    
    private let bmiLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 30)
        label.text = "30.00"
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25)
        label.text = "살빼"
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [mainLabel, bmiLabel, statusLabel])
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        setUI()
    }
    
    func setUI() {
        view.backgroundColor = .lightGray
        reCalculateButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        bmiLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        view.addSubview(reCalculateButton)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            stackView.widthAnchor.constraint(equalToConstant: 200),
            
            mainLabel.heightAnchor.constraint(equalToConstant: 30),
            bmiLabel.heightAnchor.constraint(equalToConstant: 50),
            statusLabel.heightAnchor.constraint(equalToConstant: 30),
            
            reCalculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            reCalculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            reCalculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            reCalculateButton.heightAnchor.constraint(equalToConstant: 45)
            
        ])
    }

    @objc func reCalculateButtonTapped() {
        dismiss(animated: true)
    }

}
