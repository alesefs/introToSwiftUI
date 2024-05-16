//
//  CustomTextPill.swift
//  introToSwiftUI
//
//  Created by Alessandro Emanuel Ferreira de Souza on 09/05/24.
//

import SwiftUI

enum CustomTextPillStyle: Hashable {
  case success, warning, error, info, neutral
  case custom(backgroundColor: Color, textColor: Color)

  var backgroundColor: Color {
    switch self {
    case .success:
        return .green
    case .warning:
      return .yellow
    case .error:
      return .red
    case .info:
      return .blue
    case .neutral:
      return .gray
    case let .custom(backgroundColor, _):
      return backgroundColor
    }
  }

  var textColor: Color {
    switch self {
    case .success, .error:
      return .white
    case .warning, .info, .neutral, .custom:
      return .black
    }
  }
}

struct CustomTextPillModel: Hashable {
    var text: String
    var isFilled: Bool
    var style: CustomTextPillStyle
}

struct CustomTextPill: View {
    var text: String
    var isFilled: Bool
    var style: CustomTextPillStyle
    
    init(text: String, isFilled: Bool, style: CustomTextPillStyle) {
        self.text = text
        self.isFilled = isFilled
        self.style = style
    }
    
    var body: some View {
        Text(text)
            .padding(.horizontal, 8.0)
            .font(.system(size: 12.0, weight: .medium))
            .lineLimit(1)
//            .textCase(.uppercase)
            .if(isFilled) { view in
                view.background(style.backgroundColor)
            }
            .if(!isFilled) { view in
                view.overlay(
                    RoundedRectangle(cornerRadius: 999)
                        .stroke(style.backgroundColor, lineWidth: 2)
                )
            }
            .foregroundColor(isFilled ? style.textColor : style.backgroundColor)
            .cornerRadius(999.0)
            .padding(.all, 1.0)
    }
}

#Preview {
    CustomTextPill(
        text: "Text",
        isFilled: true,
        style: CustomTextPillStyle.success
    )
}

struct CustomTextPill_Previews: PreviewProvider {
    static var previews: some View {
        var allCasesStyle: [CustomTextPillStyle] {
            return [
                .success,
                .warning,
                .error,
                .info,
                .neutral,
                .custom(backgroundColor: .cyan, textColor: .black)
            ]
        }
        
        var allCasesIsFilled: [Bool] {
            return [true, false]
        }
        
        ScrollView(.vertical) {
            VStack {
                ForEach(allCasesStyle, id: \.self) { style in
                    VStack {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(allCasesIsFilled, id: \.self) { isFilled in
                                    CustomTextPill(
                                        text: "Text",
                                        isFilled: isFilled,
                                        style: style
                                    )
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
