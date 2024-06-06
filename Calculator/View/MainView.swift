//
//  MainView.swift
//  Calculator
//
//  Created by Vlad on 6/6/24.
//

import SwiftUI

struct MainView: View {
    
    //MARK: - Properties
    
    
    //MARK: - Body
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack (spacing: 12) {
                
                Spacer()
                
                //MARK: - Display
                HStack {
                    Spacer()
                    Text("0")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 90))
                        .fontWeight(.medium)
                        .padding(.horizontal, 28)
                }
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
