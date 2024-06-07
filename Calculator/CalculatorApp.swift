//
//  CalculatorApp.swift
//  Calculator
//
//  Created by Vlad on 6/6/24.
//

import SwiftUI

@main
struct CalculatorApp: App {
    
    @StateObject var vm = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(vm)
        }
    }
}
