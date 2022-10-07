//
//  BMICalculateManager.swift
//  BMICalculate
//
//  Created by Soo Jang on 2022/10/06.
//

import UIKit

struct BMICalculateManager {
    func getBMI(height: Int, weight: Int) -> BMI{
    
        var bmi = BMI()
        
        let h = Float(height) / 100
        print(h)
        bmi.value = Float(weight) / (h * h)
        
        switch bmi.value {
        case 0..<18.5:
            bmi.status = "저체중"
            bmi.color = #colorLiteral(red: 0.4620248675, green: 0.8915500045, blue: 0.7595019937, alpha: 1)
        case 18.5..<23:
            bmi.status = "정상"
            bmi.color = #colorLiteral(red: 0.8530754447, green: 0.9590259194, blue: 0.310167104, alpha: 1)
        case 23..<25:
            bmi.status = "과체중"
            bmi.color = #colorLiteral(red: 1, green: 0.3877362609, blue: 0.5290305614, alpha: 1)
        case 25...:
            bmi.status = "비만"
            bmi.color = #colorLiteral(red: 1, green: 0.6181896329, blue: 0.5779290795, alpha: 1)
        default:
            bmi.status = "이상함.."
            bmi.color = .white
        }
        return bmi
    }
}
