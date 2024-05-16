//
//  SwiftUIView.swift
//  introToSwiftUI
//
//  Created by Alessandro Emanuel Ferreira de Souza on 14/05/24.
//

import SwiftUI

enum CustomTextValuesStyle: Hashable {
    case Dark, Light, Colors
    
    var textColor: Color {
        switch self {
        case .Dark:
            return .black
        case .Light:
            return .white
        case .Colors:
            return .gray
        }
    }
}

let patternCurrencySign = try! NSRegularExpression(pattern: "[a-zA-Z]*\\p{Sc}", options: [])

struct CustomTextValues: View {
    var value: String
    var style: CustomTextValuesStyle = CustomTextValuesStyle.Dark
    var showValue: Bool = true
    
    init(value: String, style: CustomTextValuesStyle, showValue: Bool) {
        self.value = value
        self.style = style
        self.showValue = showValue
    }

    var body: some View {
        let textValuesDescription: String = "O valor é de: \(value) reais"
        
        let valueToDouble: Double = getValueToDouble(value: value)
         
        let colorToValue: Color = if (style == CustomTextValuesStyle.Colors) {
            if (showValue) {
                if (valueToDouble < 0) {
                    Color.red
                } else if (valueToDouble > 0) {
                    Color.green
                } else {
                    Color.gray
                }
            } else {
                style.textColor
            }
        } else {
            style.textColor
        }
     
        let currencyHidden: String = getCurrencyText(value: value)
        
        let textValue = if (showValue) {
            value
        } else {
            "\(currencyHidden) ******"
        }
        
        Text(textValue)
            .lineLimit(1)
            .foregroundColor(colorToValue)
            .font(.system(size: 22, weight: .bold))
            .accessibility(identifier: textValuesDescription)
        
    }
}

private func getValueToDouble(value: String) -> Double {
    let trimmedValue = value.trimmingCharacters(in: .whitespacesAndNewlines)
    let range = NSMakeRange(0, trimmedValue.count)
    let regexedString = patternCurrencySign.stringByReplacingMatches(in: trimmedValue, options: [], range: range, withTemplate: "")
    return Double(
        regexedString.replacingOccurrences(of: " ", with: "")
            .replacingOccurrences(of: ",", with: ".")
    ) ?? 0.0
}

private func getCurrencyText(value: String) -> String {
//    if let match = patternCurrencySign.firstMatch(in: value, range: NSRange(location: 0, length: value.utf16.count)) {
//        let range = Range(match.range, in: value)!
//        let matchString = String(value[range])
//        
//        return "\(matchString)"
//    } else {
//        return ""
//    }
    
    let match = patternCurrencySign.firstMatch(in: value, range: NSRange(location: 0, length: value.utf16.count))
    let range = Range(match!.range, in: value)!
    let matchString = String(value[range])
    return "\(matchString)"
}

#Preview("CustomTextValues", traits: .sizeThatFitsLayout) {
    CustomTextValues(
        value: "R$ -100,70", style: .Dark, showValue: true//TODO: pattern pra remover letras dentro do valor
    )
}

private struct CustomTextValuesTriplePreview: Hashable {
    let value: String
    let style: CustomTextValuesStyle
    let showValue: Bool
}

struct CustomTextValues_Preview: PreviewProvider {
    static var previews: some View {
        
        var allCasesValues: [CustomTextValuesTriplePreview] {
            return [
                CustomTextValuesTriplePreview(value: "R$ 100,70", style: .Dark, showValue: true),
                CustomTextValuesTriplePreview(value: "R$ -100,70", style: .Dark, showValue: true),
                CustomTextValuesTriplePreview(value: "R$ 0,00", style: .Dark, showValue: true),
                CustomTextValuesTriplePreview(value: "R$ -100,70", style: .Dark, showValue: false),
                CustomTextValuesTriplePreview(value: "R$ 100,70", style: .Light, showValue: true),
                CustomTextValuesTriplePreview(value: "R$ -100,70", style: .Light, showValue: true),
                CustomTextValuesTriplePreview(value: "R$ 0,00", style: .Light, showValue: true),
                CustomTextValuesTriplePreview(value: "R$ -100,70", style: .Light, showValue: false),
                CustomTextValuesTriplePreview(value: "R$ 100,70", style: .Colors, showValue: true),
                CustomTextValuesTriplePreview(value: "R$ -100,70", style: .Colors, showValue: true),
                CustomTextValuesTriplePreview(value: "R$ 0,00", style: .Colors, showValue: true),
                CustomTextValuesTriplePreview(value: "R$ -100,70", style: .Colors, showValue: false),
            ]
        }
        
        ZStack {
            Color(hex: 0x005599, opacity: 1.0).ignoresSafeArea()
//            Rectangle().foregroundColor(Color(hex: 0x005599, opacity: 1.0))
            
            ScrollView(.vertical) {
                VStack {
                    ForEach(allCasesValues, id: \.self) { value in
                        CustomTextValues(
                            value: value.value,
                            style: value.style,
                            showValue: value.showValue
                        )
                    }
                }
            }
        }
    }
}
