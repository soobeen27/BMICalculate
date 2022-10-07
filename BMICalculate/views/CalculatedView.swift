//
//  CalculatedView.swift
//  BMICalculate
//
//  Created by Soo Jang on 2022/10/07.
//

import UIKit

class CalculatedView: UIView {
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "BMI 결과값"
        label.font = .systemFont(ofSize: 25)
        
        return label
    }()
    
    lazy var bmiLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 30)
//        guard let bmiNum = bmi?.0 else {return}
//        label.text = String(format: "%.2f",bmiNum)
        return label
    }()
    
    lazy var bmiView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
//        view.backgroundColor = bmi?.2
        view.addSubview(bmiLabel)
        return view
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25)
//        label.text = bmi?.1
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
    
    lazy var reCalculateButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.setTitle("다시 계산하기", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.backgroundColor = .blue
        button.tintColor = .white
//        button.addTarget(self, action: #selector(reCalculateButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        backgroundColor = .lightGray
        reCalculateButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        bmiView.translatesAutoresizingMaskIntoConstraints = false
        bmiLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        addSubview(reCalculateButton)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 130),
            stackView.widthAnchor.constraint(equalToConstant: 200),
            
            mainLabel.heightAnchor.constraint(equalToConstant: 30),
            bmiView.heightAnchor.constraint(equalToConstant: 80),
            bmiLabel.centerXAnchor.constraint(equalTo: bmiView.centerXAnchor),
            bmiLabel.centerYAnchor.constraint(equalTo: bmiView.centerYAnchor),
            
            statusLabel.heightAnchor.constraint(equalToConstant: 30),
            
            reCalculateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            reCalculateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            reCalculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30),
            reCalculateButton.heightAnchor.constraint(equalToConstant: 45)
            
        ])
    }
}
