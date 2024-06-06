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
    var isMarquee: Bool
    var style: CustomTextPillStyle
}

struct CustomTextPill: View {
    var text: String
    var isFilled: Bool
    var isMarquee: Bool
    var style: CustomTextPillStyle
    
    init(text: String, isFilled: Bool, isMarquee: Bool, style: CustomTextPillStyle) {
        self.text = text
        self.isFilled = isFilled
        self.isMarquee = isMarquee
        self.style = style
    }
    
    var body: some View {
        if (!isMarquee) {
            Text(text)
                .padding(.horizontal, 8.0)
                .font(.system(size: 12.0, weight: .medium))
                .lineLimit(1)
//              .textCase(.uppercase)
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
                
        } else {
            MarqueeText(
                text: text,
                font: .systemFont(ofSize: 12, weight: .medium),
                isFilled: isFilled,
                style: style
            )
        }
    }
}

struct MarqueeText: View {
    @State var text: String
    var font: UIFont
    var isFilled: Bool
    var style: CustomTextPillStyle
    
    //Storing text size
    @State var storeSize: CGSize = .zero
    //Mark: AnimationOffset
    @State var offset: CGFloat = 0
    //MARK: animation speed
    var animationSpeed: Double = 0.02
    var delayTime: Double = 0.5 //if 0 = continuos
    
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Text(text)
                .padding(.horizontal, 8.0)
                .font(Font(font))
                .offset(x: offset)
                .lineLimit(1)
        }
        .frame(width: 75)
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
        .disabled(true)
        .onAppear {
            
            //base text
            let baseText = text
            
            //MARK: continuos text animation
            //add spacing for continuos text
            (1...10).forEach { _ in
                text.append(" ")
            }
            
            //stop animation before next text
            storeSize = textSize()
            text.append(baseText)
            
            //calc total secs based on text Width
            //our animation speed for eache character will be 0.02s
            let timing: Double = (animationSpeed * storeSize.width)
            
            //delay for 1st animation
            DispatchQueue.main.asyncAfter(deadline: .now() + delayTime) {
                withAnimation(.linear(duration: timing)) {
                    offset = -storeSize.width
                }
            }
        }
        //option if you want some delay for next animation
        .onReceive(Timer.publish(every: ((animationSpeed * storeSize.width) + delayTime), on: .main, in: .default).autoconnect()) { _ in
            offset = 0
            
            withAnimation(.linear(duration: (animationSpeed * storeSize.width))) {
                offset = -storeSize.width
            }
        }
        
    }
    
    //Mark: Fecting Text Size for offset animation
    func textSize() -> CGSize {
        let attrs = [NSAttributedString.Key.font: font]
        
        let size = (text as NSString).size(withAttributes: attrs)
        
        return size
    }
}

#Preview {
    CustomTextPill(
        text: "Text",
        isFilled: true,
        isMarquee: false,
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
        
        var allCasesIsMarquee: [Bool] {
            return [true, false]
        }
        
        ScrollView(.vertical) {
            VStack {
                ForEach(allCasesStyle, id: \.self) { style in
                    VStack {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(allCasesIsFilled, id: \.self) { isFilled in
                                    ForEach(allCasesIsFilled, id: \.self) { isMarquee in
                                        CustomTextPill(
                                            text: isMarquee ? "Tech, Video games" : "Texts",
                                            isFilled: isFilled,
                                            isMarquee: isMarquee,
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
}
