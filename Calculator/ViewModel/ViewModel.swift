//
//  ViewModel.swift
//  Calculator
//
//  Created by Vlad on 7/6/24.
//

import SwiftUI

class ViewModel: ObservableObject {
    
    //MARK: - Properties
    @Published var value = "0"
    @Published var number: Double = 0.0
    @Published var currentOperation: Operation = .none
    
    //Massive
    let buttonsArray: [[Buttons]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiple],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equal]
    ]
    
    //MARK: - Button Functionality
    
    // Remove Zero
    func formatResult(_ result: Double) -> String {
        return String(format: "%g", result)
    }
    
    // Size of Buttons
    func buttonWidth(item: Buttons) -> CGFloat {
        let spacing: CGFloat = 12
        let totalSpacing: CGFloat = 5 * spacing
//        let zeroTotalSpacing: CGFloat = 4 * spacing
        let totalColums: CGFloat = 4
        let screenWidth = UIScreen.main.bounds.width
        
        if item == .zero {
            return (screenWidth - totalSpacing) / totalColums * 2.1
        }
        
        return (screenWidth - totalSpacing) / totalColums
    }
    
    func buttonHeight() -> CGFloat {
        let spacing: CGFloat = 12
        let totalSpacing: CGFloat = 5 * spacing
        let totalColums: CGFloat = 4
        let screenWidth = UIScreen.main.bounds.width
        
        return (screenWidth - totalSpacing) / totalColums
    }
    
    // Tap buttons method
    func didTap(item: Buttons) {
        switch item {
            
        case .plus, .minus, .multiple, .divide:
            currentOperation = item.buttonToOperation()
            number = Double(value) ?? 0
            value = "0"
            
        case .equal:
            if let currentValue = Double(value) {
               value = formatResult(performOperation(currentValue))
            }
            
        case .decimal:
            if !value.contains(".") {
                value += "."
            }
            
        case .percent:
            if let currentValue = Double(value) {
                value = formatResult(currentValue / 100)
            }
            
        case .negative:
            if let currentValue = Double(value) {
                value = formatResult(-currentValue)
            }
            
        case .clear:
            value = "0"
            
        default:
            if value == "0" {
                value = item.rawValue
            } else {
                value += item.rawValue
            }
        }
    }
    
    // Helper calculate method
    func performOperation (_ currentValue: Double) -> Double {
        switch currentOperation {
        case .addition:
            return number + currentValue
        case .subtract:
            return number - currentValue
        case .multiply:
            return number * currentValue
        case .divide:
            return number / currentValue
        default:
            return currentValue
        }
    }
    
}
