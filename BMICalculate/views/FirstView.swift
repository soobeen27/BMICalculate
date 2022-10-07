//
//  firstView.swift
//  BMICalculate
//
//  Created by Soo Jang on 2022/10/07.
//

import UIKit

class FirstView: UIView {
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "키와 몸무게를 입력해주세요"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private let heightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "키"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let weightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "몸무게"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    let heightTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 5
        tf.clipsToBounds = true
        return tf
    }()
    let weightTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white

        tf.layer.cornerRadius = 5
        tf.clipsToBounds = true
        return tf
    }()
    
    private lazy var mainStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [mainLabel
                                                ,heightStackView,weightStackView
                                               ])
        st.spacing = 20
        st.axis = .vertical
        st.alignment = .fill
        st.distribution = .fillEqually
        
        return st
    }()
    
    private lazy var heightStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [heightLabel, heightTextField])
        st.spacing = 20
        st.axis = .horizontal
        st.alignment = .fill
        st.distribution = .fill
        return st
    }()
    
    private lazy var weightStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [weightLabel, weightTextField])
        st.spacing = 20
        st.axis = .horizontal
        st.alignment = .fill
        st.distribution = .fill
        return st
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.setTitle("BMI 계산하기", for: .normal)
        button.backgroundColor = .blue
        button.tintColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
//        button.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let viewHeight: CGFloat = 35
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        heightTextField.delegate = self
        weightTextField.delegate = self
        backgroundColor = .lightGray
        addSubview(mainStackView)
        addSubview(calculateButton)
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.translatesAutoresizingMaskIntoConstraints = false

        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        heightTextField.translatesAutoresizingMaskIntoConstraints = false
        heightStackView.translatesAutoresizingMaskIntoConstraints = false

        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        weightTextField.translatesAutoresizingMaskIntoConstraints = false
        weightStackView.translatesAutoresizingMaskIntoConstraints = false
        
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 130),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            mainStackView.heightAnchor.constraint(equalToConstant: (viewHeight * 3) + 40),
            
            
            heightLabel.widthAnchor.constraint(equalToConstant: 70),
            weightLabel.widthAnchor.constraint(equalToConstant: 70),
            
            
            calculateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            calculateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            calculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30),
            calculateButton.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
}

extension FirstView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       if textField == heightTextField {
          textField.resignFirstResponder()
          weightTextField.becomeFirstResponder()
       } else if textField == weightTextField {
           textField.resignFirstResponder()
       }
      return true
     }
    
}
