//
//  BackgroundView.swift
//  Calculator
//
//  Created by Vlad on 6/6/24.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.CalcIndigo, Color.CalcCerulean, Color.CalcTurquoise, Color.CalcPeriwinkle]),
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
