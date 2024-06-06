//
//  ButtonsView.swift
//  Calculator
//
//  Created by Vlad on 6/6/24.
//

import SwiftUI

struct ButtonsView: View {
    
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
        
        //MARK: - Buttons
        ForEach(buttonsArray, id: \.self) { row in
            HStack (spacing: 12) {
                ForEach(row, id: \.self) { item in
                    Button {
                        // action
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
    
    //MARK: - Functionality
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
}

//MARK: - Preview
#Preview {
    ButtonsView()
}
