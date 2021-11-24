//
//  SecondaryButtonStyle.swift
//  FungiFinder
//
//  Created by Mohammad Azam on 11/3/20.
//

import Foundation
import SwiftUI

struct SecondaryButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
        .foregroundColor(Color(#colorLiteral(red: 0.3843096495, green: 0.1917563975, blue: 0.7529312968, alpha: 1)))
        .font(.headline)
        .frame(maxWidth: .infinity, maxHeight: 44)
            .background(Color(#colorLiteral(red: 0.9450903535, green: 0.9372463822, blue: 0.9802352786, alpha: 1)).opacity(
                configuration.isPressed ? 0.5: 1 
            ))
        .cornerRadius(10)
    }
    
}
