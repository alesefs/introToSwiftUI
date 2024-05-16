//
//  CustomCard.swift
//  introToSwiftUI
//
//  Created by Alessandro Emanuel Ferreira de Souza on 08/05/24.
//

import SwiftUI

struct CustomCardCornerRadius: Hashable {
    let radius: CGFloat
    let topLeading: Bool
    let topTrailing: Bool
    let bottomLeading: Bool
    let bottomTrailing: Bool
}

struct CustomCardStroke: Hashable {
    let size: CGFloat
    let color: Color
}

struct CustomCardDecoration: Hashable {
    let size: CGFloat
    let color: Color
}

enum CustomCardStyleName: Hashable {
    case Base, Stroke, Elevation, Emphasis
}

extension Color {
    static let lightTeal = Color(red: 0 / 255, green: 220 / 255, blue: 220 / 255)
    static let darkPink = Color(red: 208 / 255, green: 45 / 255, blue: 208 / 255)
    static let lightGray = Color(red: 204 / 255, green: 204 / 255, blue: 204 / 255, opacity:1.0)
}

enum CustomCardStyle: Hashable {
    case Base(
        cardRadius: CustomCardCornerRadius
    )
    case Stroke(
        backgroundColor: Color = .white,
        cardRadius: CustomCardCornerRadius,
        strokeStyle: CustomCardStroke
    )
    case Elevation(
        backgroundColor: Color = .white,
        cardRadius: CustomCardCornerRadius,
        elevationValue: CGFloat
    )
    case Emphasis(
        cardRadius: CustomCardCornerRadius
    )
    
    var style: CustomCardStyleName {
        switch self {
        case .Base(_):
            return .Base
        case .Stroke(_, _, _):
            return .Stroke
        case .Elevation(_, _, _):
            return .Elevation
        case .Emphasis(_):
            return .Emphasis
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .Base(cardRadius: _):
            return .white
        case .Stroke(backgroundColor: let backgroundColor, cardRadius: _, strokeStyle: _):
            return backgroundColor
        case .Elevation(backgroundColor: let backgroundColor, cardRadius: _, elevationValue: _):
            return backgroundColor
        case .Emphasis(cardRadius: _):
            return .lightGray
        }
    }
    
    var strokeStyle: CustomCardStroke {
        switch self {
        case .Stroke(_, _, let strokeStyle):
            return strokeStyle
        default:
            return CustomCardStroke(
                size: 0, color: .clear
            )
        }
    }
    
    var elevationValue: CGFloat {
        switch self {
        case .Elevation(_, _, let elevationValue):
            return elevationValue
        default:
            return 0
        }
    }
        
    var cardRadius: CustomCardCornerRadius {
        switch self {
        case .Base(let cardRadius):
            return cardRadius
        case .Stroke(_, let cardRadius, _):
            return cardRadius
        case .Elevation(_, let cardRadius, _):
            return cardRadius
        case .Emphasis(let cardRadius):
            return cardRadius
        }
    }
}

struct CustomCard: ViewModifier {
    var style: CustomCardStyle
    var decorated: CustomCardDecoration?
    
    init(style: CustomCardStyle, decorated: CustomCardDecoration? = nil) {
        self.style = style
        self.decorated = decorated
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(
                ZStack {
                    UnevenRoundedRectangle(
                        cornerRadii: RectangleCornerRadii(
                            topLeading: (style.cardRadius.topLeading) ? style.cardRadius.radius : 0,
                            bottomLeading: (style.cardRadius.bottomLeading) ? style.cardRadius.radius : 0,
                            bottomTrailing: (style.cardRadius.bottomTrailing) ? style.cardRadius.radius : 0,
                            topTrailing: (style.cardRadius.topTrailing) ? style.cardRadius.radius : 0
                        ),
                        style: .continuous
                    )
                    .fill(style.backgroundColor, style: FillStyle(eoFill: true, antialiased: true))
                    .strokeBorder(style.strokeStyle.color, lineWidth: style.strokeStyle.size)
                    .shadow(radius: style.elevationValue)
                    
                    
                    if (decorated != nil) {
                        HStack {
                            UnevenRoundedRectangle(
                                cornerRadii: RectangleCornerRadii(
                                    topLeading: (style.cardRadius.topLeading) ? style.cardRadius.radius - 4 : 0,
                                    bottomLeading: (style.cardRadius.bottomLeading) ? style.cardRadius.radius - 4 : 0,
                                    bottomTrailing: 0,
                                    topTrailing: 0
                                ),
                                style: .continuous
                            )
                            .fill(decorated?.color ?? style.backgroundColor)
                            .frame(width: decorated?.size, height: .infinity)
                            
                            Spacer()
                        }
                        .if (style.style == CustomCardStyleName.Stroke) { view in
                            view.padding(.all, style.strokeStyle.size)
                        }
                    }
                    
                    content
                }
            )
    }
}

struct CustomCardPreview1: View {
    var body: some View {
        VStack {
            VStack {
                Text("Hello, world!")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            .modifier(
                CustomCard(
                    style: CustomCardStyle.Elevation(
                        backgroundColor: .yellow,
                        cardRadius: CustomCardCornerRadius(
                            radius: 16,
                            topLeading: true,
                            topTrailing: true,
                            bottomLeading: true,
                            bottomTrailing: true
                        ),
                        elevationValue: 4
                    ),
                    decorated: CustomCardDecoration(
                        size: 24, color: .blue
                    )
                )
                /*CustomCard(
                    style: CustomCardStyle.Base(
                        cardRadius: CustomCardCornerRadius(
                            radius: 16,
                            topLeading: false,
                            topTrailing: true,
                            bottomLeading: false,
                            bottomTrailing: true
                        )
                    )
                )*/
                /*CustomCard(
                    style: CustomCardStyle.Stroke(
                        backgroundColor: .cyan,
                        cardRadius: CustomCardCornerRadius(
                            radius: 16,
                            topLeading: false,
                            topTrailing: true,
                            bottomLeading: false,
                            bottomTrailing: true
                        ),
                        strokeStyle: CustomCardStroke(size: 4, color: .purple)
                    )
                )*/
                /*CustomCard(
                    style: CustomCardStyle.Emphasis(
                        cardRadius: CustomCardCornerRadius(
                            radius: 16,
                            topLeading: false,
                            topTrailing: true,
                            bottomLeading: false,
                            bottomTrailing: true
                        )
                    )
                )*/
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}

#Preview {
    CustomCardPreview1()
}

struct CustomCard_Previews: PreviewProvider {
    static var previews: some View {
        
        var allCasesStyle: [CustomCardStyle] {
            return [
                .Base(
                    cardRadius: CustomCardCornerRadius(
                        radius: 16,
                        topLeading: true,
                        topTrailing: true,
                        bottomLeading: false,
                        bottomTrailing: true
                    )
                ),
                .Stroke(
                    backgroundColor: .cyan,
                    cardRadius: CustomCardCornerRadius(
                        radius: 16,
                        topLeading: true,
                        topTrailing: true,
                        bottomLeading: true,
                        bottomTrailing: true
                    ),
                    strokeStyle: CustomCardStroke(size: 4, color: .purple)
                ),
                .Elevation(
                    backgroundColor: .yellow,
                    cardRadius: CustomCardCornerRadius(
                        radius: 16,
                        topLeading: false,
                        topTrailing: false,
                        bottomLeading: true,
                        bottomTrailing: true
                    ),
                    elevationValue: 4
                ),
                .Emphasis(
                    cardRadius: CustomCardCornerRadius(
                        radius: 16,
                        topLeading: true,
                        topTrailing: true,
                        bottomLeading: true,
                        bottomTrailing: true
                    )
                )
            ]
        }
        
        ScrollView(.vertical) {
            VStack {
                ForEach(allCasesStyle, id: \.self) { style in
                    CustomFeedbackScreen(
                        title: "The quick brown fox jumps over",
                        description: "He lands head first on a rotting maple log.\n" +
                        "Knocked unconscious, fox sleeps with shallow breath\n" +
                        "until the lazy dog awakes.",
                        icon: "binoculars.fill",
                        size: CustomFeedbackSize.Medium(),
                        style: CustomFeedbackStyle.Info,
                        action: FeedbackActions(actionTitle: "Click!"){
                            print("Click!")
                        }
                    )
                    .modifier(
                        CustomCard(
                            style: style
                        )
                    )
                }
                
                CustomFeedbackScreen(
                    title: "The quick brown fox jumps over",
                    description: "He lands head first on a rotting maple log.\n" +
                    "Knocked unconscious, fox sleeps with shallow breath\n" +
                    "until the lazy dog awakes.",
                    icon: "binoculars.fill",
                    size: CustomFeedbackSize.Medium(),
                    style: CustomFeedbackStyle.Success,
                    action: FeedbackActions(actionTitle: "Click!"){
                        print("Click!")
                    }
                )
                .modifier(
                    CustomCard(
                        style: CustomCardStyle.Stroke(
                            backgroundColor: .orange,
                            cardRadius: CustomCardCornerRadius(
                                radius: 16,
                                topLeading: true,
                                topTrailing: true,
                                bottomLeading: true,
                                bottomTrailing: true
                            ),
                            strokeStyle: CustomCardStroke(size: 4, color: .purple)
                        ),
                        decorated: CustomCardDecoration(
                            size: 24, color: .blue
                        )
                    )
                )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.lightTeal)
        
    }
}
