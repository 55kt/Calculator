//
//  ButtonsView.swift
//  Calculator
//
//  Created by Vlad on 6/6/24.
//

import SwiftUI

struct ButtonsView: View {
    
    //MARK: - Properties
    @State private var value = "0"
    @State private var number: Double = 0.0
    @State private var currentOperation: Operation = .none
    
    //MARK: - Body
    var body: some View {
        
        //MARK: - Properties
        let buttonsArray: [[Buttons]] = [
            [.clear, .negative, .percent, .divide],
            [.seven, .eight, .nine, .multiple],
            [.four, .five, .six, .minus],
            [.one, .two, .three, .plus],
            [.zero, .decimal, .equal]
        ]
        
        //MARK: - Display
        HStack {
            Spacer()
            Text(value)
                .foregroundStyle(Color.white)
                .font(.system(size: 90))
                .fontWeight(.medium)
                .padding(.horizontal, 28)
        }
        
        //MARK: - Buttons
        ForEach(buttonsArray, id: \.self) { row in
            HStack (spacing: 12) {
                ForEach(row, id: \.self) { item in
                    Button {
                        self.didTap(item: item)
                    } label: {
                        Text(item.rawValue)
                            .frame(
                                width: self.buttonWidth(item: item),
                                height: self.buttonHeight())
                            .foregroundStyle(item.buttonFontColor)
                            .background(item.buttonColor)
                            .font(.system(size: 35))
                            .fontWeight(.medium)
                            .cornerRadius(40)
                    }
                }
            }
        }
    }
    
    //Remove Zero
    func formatResult(_ result: Double) -> String {
        return String(format: "%g", result)
    }
    
    //MARK: - Size of Buttonc
    func buttonWidth(item: Buttons) -> CGFloat {
        let spacing: CGFloat = 12
        let totalSpacing: CGFloat = 5 * spacing
        let zeroTotalSpacing: CGFloat = 4 * spacing
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
    
    //MARK: - Tap button method
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
    
    //MARK: - Helper calculate method
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

//MARK: - Preview
#Preview {
    ButtonsView()
}
