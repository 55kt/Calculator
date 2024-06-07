//
//  MainView.swift
//  Calculator
//
//  Created by Vlad on 6/6/24.
//

import SwiftUI

struct MainView: View {
    
    //MARK: - Body
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack (spacing: 12) {
                
                Spacer()
                ButtonsView()
            }
            .padding(.bottom)
        }
    }
    
    
    
    

    
}

//MARK: - Preview
#Preview {
    MainView()
}
