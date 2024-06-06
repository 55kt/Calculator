//
//  Model.swift
//  Calculator
//
//  Created by Vlad on 6/6/24.
//

import SwiftUI

enum Buttons: String {
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case plus = "+"
    case minus = "-"
    case multiple = "x"
    case divide = "/"
    case equal = "="
    case decimal = "."
    case percent = "%"
    case negative = "+/-"
    case clear = "AC" 
    
    var buttonColor: Color {
        switch self {
        case .clear, .negative, .percent:
            return Color.CalcTurquoise
        case .divide, .multiple, .minus, .plus, .equal:
            return Color.CalcPeriwinkle
        default:
            return Color.CalcIndigo
        }
    }
    
    var buttonFontColor: Color {
        switch self {
        case .clear, .negative, .percent:
            return Color.CalcIndigo
        default:
            return Color.white
        }
    }
}
