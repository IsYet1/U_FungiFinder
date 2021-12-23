//
//  PrimaryButtonStyle.swift
//  FungiFinder
//
//  Created by Mohammad Azam on 11/3/20.
//

import Foundation
import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
            .foregroundColor(Color.white)
            .frame(maxWidth: .infinity, maxHeight: 44)
                .background(Color(#colorLiteral(red: 0.3972868323, green: 0.1897616684, blue: 0.7682217956, alpha: 1)).opacity(
                    configuration.isPressed ? 0.5: 1
                ))
            .cornerRadius(10)
    }
}
