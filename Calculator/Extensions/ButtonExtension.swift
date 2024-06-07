//
//  ButtonExtension.swift
//  Calculator
//
//  Created by Vlad on 7/6/24.
//

import SwiftUI

extension Buttons {
    func buttonToOperation() -> Operation {
        switch self {
        case .plus:
            return .addition
        case .minus:
            return .subtract
        case .multiple:
            return .multiply
        case .divide:
            return .divide
        default:
            return .none
        }
    }
}
