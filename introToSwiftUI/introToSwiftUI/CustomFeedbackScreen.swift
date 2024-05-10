//
//  CustomFeedbackScreen.swift
//  introToSwiftUI
//
//  Created by Alessandro Emanuel Ferreira de Souza on 09/05/24.
//

import SwiftUI

enum CustomFeedbackStyle: Hashable {
    case Success, Warning, Error, Info, Neutral
    case Custom(shapeColor: Color, iconColor: Color)
    
    var style: CustomIconStyle {
        switch self {
        case .Success:
            return CustomIconStyle.Success
        case .Warning:
            return CustomIconStyle.Warning
        case .Error:
            return CustomIconStyle.Error
        case .Info:
            return CustomIconStyle.Info
        case .Neutral:
            return CustomIconStyle.Neutral(showShape: true)
        case .Custom(shapeColor: let shapeColor, iconColor: let iconColor):
            return CustomIconStyle.Custom(shapeColor: shapeColor, iconColor: iconColor, showShape: true)
        }
    }
}

struct CustomFeedbackSizes {
    let horizontalPadding: CGFloat
    let verticalPadding: CGFloat
    let iconPadding: CGFloat
    let iconSize: CustomIconSize
    let titleFontSize: CGFloat
    let descriptionFontSize: CGFloat
    let textAlign: TextAlignment
    let contentAlign: HorizontalAlignment
}

enum CustomFeedbackSize: Hashable {
    case Large(showCard: Bool = true), Medium(showCard: Bool = false), Small(showCard: Bool = false)
    
    var showCard: Bool {
        switch self {
        case .Large(showCard: let showCard):
            return showCard
        case .Medium(showCard: let showCard):
            return showCard
        case .Small(showCard: let showCard):
            return showCard
        }
    }
    
    var sizes: CustomFeedbackSizes {
        switch self {
            
        case .Large(showCard: _):
            return CustomFeedbackSizes(
                horizontalPadding: 16,
                verticalPadding: 24,
                iconPadding: 16,
                iconSize: CustomIconSize.Large,
                titleFontSize: 24,
                descriptionFontSize: 16,
                textAlign: .center,
                contentAlign: HorizontalAlignment.center
            )
        case .Medium(showCard: _):
            return CustomFeedbackSizes(
                horizontalPadding: 12,
                verticalPadding: 16,
                iconPadding: 16,
                iconSize: CustomIconSize.Medium,
                titleFontSize: 18,
                descriptionFontSize: 14,
                textAlign: .center,
                contentAlign: HorizontalAlignment.center
            )
        case .Small(showCard: _):
            return CustomFeedbackSizes(
                horizontalPadding: 16,
                verticalPadding: 16,
                iconPadding: 8,
                iconSize: CustomIconSize.Small,
                titleFontSize: 16,
                descriptionFontSize: 12,
                textAlign: .leading,
                contentAlign: HorizontalAlignment.leading
            )
        }
    }
}
    
struct FeedbackActions {
    let actionTitle: String
    let action: (() -> Void)
}
    
struct CustomFeedbackScreen: View {
    var title: String
    var description: String?
    var icon: String
    var size: CustomFeedbackSize
    var style: CustomFeedbackStyle
    var action: FeedbackActions?
    
    init(title: String, description: String? = nil, icon: String, size: CustomFeedbackSize, style: CustomFeedbackStyle, action: FeedbackActions? = nil) {
        self.title = title
        self.description = description
        self.icon = icon
        self.size = size
        self.style = style
        self.action = action
    }
    
    var body: some View {
        
        switch size {
        case .Large:
            if (size.showCard) {
                ZStack {
                    FeedbackContentLargeMedium(
                        title: title,
                        description: description,
                        size: size,
                        style: style,
                        action: action,
                        icon: icon
                    )
                }
                .frame(width: .infinity)
                .background(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.gray, lineWidth: 2)
                )
                .cornerRadius(16.0)
            } else {
                FeedbackContentLargeMedium(
                    title: title,
                    description: description,
                    size: size,
                    style: style,
                    action: action,
                    icon: icon
                )
            }
            
        case .Medium:
            if (size.showCard) {
                ZStack {
                    FeedbackContentLargeMedium(
                        title: title,
                        description: description,
                        size: size,
                        style: style,
                        action: action,
                        icon: icon
                    )
                }
                .frame(width: 328)
                .background(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.gray, lineWidth: 2)
                )
                .cornerRadius(16.0)
            } else {
                FeedbackContentLargeMedium(
                    title: title,
                    description: description,
                    size: size,
                    style: style,
                    action: action,
                    icon: icon
                )
            }
            
        case .Small:
            if (size.showCard) {
                ZStack {
                    FeedbackContentSmall(
                        title: title,
                        description: description,
                        size: size,
                        style: style,
                        action: action,
                        icon: icon
                    )
                }
                .frame(width: 328)
                .background(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.gray, lineWidth: 2)
                )
                .cornerRadius(16.0)
            } else {
                FeedbackContentSmall(
                    title: title,
                    description: description,
                    size: size,
                    style: style,
                    action: action,
                    icon: icon
                )
            }
        }
    }
}
    
    
private struct FeedbackContentLargeMedium: View {
    var title: String
    var description: String?
    var size: CustomFeedbackSize
    var style: CustomFeedbackStyle
    var icon: String
    var action: FeedbackActions?
    
    init(title: String, description: String? = nil, size: CustomFeedbackSize, style: CustomFeedbackStyle, action: FeedbackActions? = nil, icon: String) {
        self.title = title
        self.description = description
        self.size = size
        self.style = style
        self.action = action
        self.icon = icon
    }
    
    var body: some View {
        VStack(alignment: .center) {
            FeedbackIcon(icon: icon, size: size, style: style)
            
            FeedbackTextsAndActionContent(title: title, description: description, size: size, style: style, action: action)
        }
        .if(size == CustomFeedbackSize.Large()) { view in
            view.frame(width: .infinity)
        }
        .if(size == CustomFeedbackSize.Medium()) { view in
            view.frame(width: 328)
        }
        .padding(.horizontal, size.sizes.horizontalPadding)
        .padding(.vertical, size.sizes.verticalPadding)
    }
}
    
private struct FeedbackContentSmall: View {
    var title: String
    var description: String?
    var size: CustomFeedbackSize
    var style: CustomFeedbackStyle
    var action: FeedbackActions?
    var icon: String
    
    init(title: String, description: String? = nil, size: CustomFeedbackSize, style: CustomFeedbackStyle, action: FeedbackActions? = nil, icon: String) {
        self.title = title
        self.description = description
        self.size = size
        self.style = style
        self.action = action
        self.icon = icon
    }
    
    var body: some View {
        HStack(alignment: .top) {
            FeedbackIcon(icon: icon, size: size, style: style)
            
            FeedbackTextsAndActionContent(title: title, description: description, size: size, style: style, action: action)
        }
        .frame(width: 328)
        .padding(.horizontal, size.sizes.horizontalPadding)
        .padding(.vertical, size.sizes.verticalPadding)
    }
}
    
    
private struct FeedbackTextsAndActionContent: View {
    var title: String
    var description: String?
    var size: CustomFeedbackSize
    var style: CustomFeedbackStyle
    var action: FeedbackActions?
    
    init(title: String, description: String? = nil, size: CustomFeedbackSize, style: CustomFeedbackStyle, action: FeedbackActions? = nil) {
        self.title = title
        self.description = description
        self.size = size
        self.style = style
        self.action = action
    }
    
    var body: some View {
        VStack(alignment: size.sizes.contentAlign) {
            Text(title)
                .foregroundColor(.black)
                .font(.system(size: size.sizes.titleFontSize))
                .multilineTextAlignment(size.sizes.textAlign)
                .if(size == CustomFeedbackSize.Large()) { view in
                    view.frame(width: .infinity)
                }
                .if(size == CustomFeedbackSize.Medium()) { view in
                    view.frame(width: 328)
                }
            
            if (description != nil) {
                Spacer().frame(height: 8)
                
                Text(description!)
                    .foregroundColor(.gray)
                    .font(.system(size: size.sizes.descriptionFontSize))
                    .multilineTextAlignment(size.sizes.textAlign)
                    .if(size == CustomFeedbackSize.Large()) { view in
                        view.frame(width: .infinity)
                    }
                    .if(size == CustomFeedbackSize.Medium()) { view in
                        view.frame(width: 328)
                    }
            }
            
            if (action != nil) {
                Spacer().frame(height: 16)
                
                Text(action!.actionTitle)
                    .foregroundColor(.blue)
                    .font(.system(size: 16))
                    .multilineTextAlignment(size.sizes.textAlign)
                    .if(size == CustomFeedbackSize.Large()) { view in
                        view.frame(width: .infinity)
                    }
                    .if(size == CustomFeedbackSize.Medium()) { view in
                        view.frame(width: 328)
                    }
                    .cornerRadius(999.0)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .onTapGesture {
                        action!.action()
                    }
            }
        }
    }
}

private struct FeedbackIcon: View {
    var icon: String
    var size: CustomFeedbackSize
    var style: CustomFeedbackStyle
    
    init(icon: String, size: CustomFeedbackSize, style: CustomFeedbackStyle) {
        self.icon = icon
        self.size = size
        self.style = style
    }
    
    var body: some View {
        CustomIcon(
            icon: icon,
            style: style.style,
            size: size.sizes.iconSize
        )
        
        switch size {
            case .Large:
            Spacer().frame(width: .infinity, height: size.sizes.iconPadding)
            case .Medium:
            Spacer().frame(width: .infinity, height: size.sizes.iconPadding)
            case .Small:
            Spacer().frame(width: size.sizes.iconPadding, height: .infinity)
        }
    }
}

    
#Preview {
    CustomFeedbackScreen(
        title: "The quick brown fox jumps over",
        description: "He lands head first on a rotting maple log.\n" +
        "Knocked unconscious, fox sleeps with shallow breath\n" +
        "until the lazy dog awakes.",
        icon: "binoculars.fill",
        size: CustomFeedbackSize.Medium(),
        style: CustomFeedbackStyle.Success,
        action: FeedbackActions(actionTitle: "Click!"){}
    )
}
    
    
struct CustomFeedback_Previews: PreviewProvider {
    static var previews: some View {
        var allCasesStyle: [CustomFeedbackStyle] {
            return [
                .Success,
                .Warning,
                .Error,
                .Info,
                .Neutral,
                .Custom(shapeColor: Color.cyan, iconColor: .black)
            ]
        }
        
        var allCasesSize: [CustomFeedbackSize] {
            return [
                .Large(),
                .Medium(),
                .Small()
            ]
        }
        
        ScrollView(.vertical) {
            VStack {
                ForEach(allCasesStyle, id: \.self) { style in
                    VStack {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(allCasesSize, id: \.self) { size in
                                    CustomFeedbackScreen(
                                        title: "The quick brown fox jumps over",
                                        description: "He lands head first on a rotting maple log.\n" +
                                        "Knocked unconscious, fox sleeps with shallow breath\n" +
                                        "until the lazy dog awakes.",
                                        icon: "binoculars.fill",
                                        size: size,
                                        style: style,
                                        action: FeedbackActions(actionTitle: "Click!"){}
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


struct CustomFeedbackSuccess_Preview: PreviewProvider {
    static var previews: some View {
        var allCasesSize: [CustomFeedbackSize] {
            return [
                .Large(showCard: true),
                .Large(showCard: false),
                .Medium(showCard: true),
                .Medium(showCard: false),
                .Small(showCard: true),
                .Small(showCard: false)
            ]
        }
        
        ScrollView(.vertical) {
            VStack {
                ForEach(allCasesSize, id: \.self) { size in
                    CustomFeedbackScreen(
                        title: "The quick brown fox jumps over",
                        description: "He lands head first on a rotting maple log.\n" +
                        "Knocked unconscious, fox sleeps with shallow breath\n" +
                        "until the lazy dog awakes.",
                        icon: "binoculars.fill",
                        size: size,
                        style: CustomFeedbackStyle.Success,
                        action: FeedbackActions(actionTitle: "Click!"){}
                    )
                }
            }
        }
    }
}
