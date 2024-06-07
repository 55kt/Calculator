//
//  ButtonsView.swift
//  Calculator
//
//  Created by Vlad on 6/6/24.
//

import SwiftUI

struct ButtonsView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    
    //MARK: - Body
    var body: some View {
        
        //MARK: - Buttons
        ForEach(vm.buttonsArray, id: \.self) { row in
            HStack (spacing: 12) {
                ForEach(row, id: \.self) { item in
                    Button {
                        vm.didTap(item: item)
                    } label: {
                        Text(item.rawValue)
                            .frame(
                                width: vm.buttonWidth(item: item),
                                height: vm.buttonHeight())
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
    
    
}

//MARK: - Preview
#Preview {
    ButtonsView()
        .environmentObject(ViewModel())
}
