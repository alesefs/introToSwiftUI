//
//  CustomActionText.swift
//  introToSwiftUI
//
//  Created by Alessandro Emanuel Ferreira de Souza on 16/05/24.
//

import SwiftUI

struct TextStyle {
    var textColor: Color = .red
    var fontSize: CGFloat = 16
    var fontWeight: Font.Weight = .semibold
}

struct CustomActionText: View {
    var text: String
    var style: TextStyle
    
    /*
    init(
        _ text: String, //_ omite text
     ) { self.text = text }
    */
    
    init(
        text: String,
        style: TextStyle = TextStyle(textColor: .red, fontSize: 16.0, fontWeight: .semibold)
    ) {
        self.text = text
        self.style = style
    }
    
    var body: some View {
        Text(text)
            .padding(.horizontal, 1.0)
            .lineLimit(1)
            .foregroundColor(style.textColor)
            .font(.system(
                size: style.fontSize,
                weight: style.fontWeight
            ))
    }
}

#Preview {
//    CustomActionText(
//        text: "alessandro",
//        style: TextStyle(
//            textColor: .blue,
//            fontSize: 32.0,
//            fontWeight: .semibold
//        )
//    )
    
    VStack(spacing: 0) {
        CustomActionText(text: "kjslkajhdl")
        CustomActionText(text: "kjslkajhdl")
    }
}
