//
//  CustomAction.swift
//  introToSwiftUI
//
//  Created by Alessandro Emanuel Ferreira de Souza on 16/05/24.
//

import SwiftUI

enum CustomActionStyleName {
    case Icon, Text
}


enum CustomActionStyle {
    case Icon(
        actionIcon: String,
        action: () -> Void
    )
    
    case Text(
        actionText: String,
        textStyle: TextStyle,
        action: () -> Void
    )
    
    var style: CustomActionStyleName {
        switch self {
        case .Icon(_, _):
            return .Icon
        case .Text(_, _, _):
            return .Text
        }
    }
    
    var actionIcon: String? {
        switch self {
        case .Icon(let actionIcon, _):
                return actionIcon
        case .Text(_, _, _):
                return nil
        }
    }
    
    var actionText: String? {
        switch self {
        case .Icon(_, _):
                return nil
        case .Text(let actionText, _, _):
                return actionText
        }
    }
    
    var action: () -> Void {
        switch self {
        case .Icon(_, let action):
                return action
        case .Text(_, _, let action):
                return action
        }
    }
    
    var textStyle: TextStyle? {
        switch self {
            case .Icon(_, _):
                return nil
            case .Text(_, let textStyle, _):
            return textStyle
            }
    }
}

struct CustomAction: View {
    var style: CustomActionStyle
    
    init(style: CustomActionStyle) {
        self.style = style
    }
    
    var body: some View {
        switch (style.style) {
            case .Icon:
                CustomIcon(
                    icon: style.actionIcon!,
                    style: .Custom(
                        shapeColor: .clear,
                        iconColor: .red,
                        showShape: false
                    ),
                    size: .Large
                ).onTapGesture {
                    style.action()
                }

            case .Text:
                CustomActionText(
                    text: style.actionText!,
                    style: style.textStyle!
                ).onTapGesture {
                    style.action()
                }
        }
    }
}

#Preview {
    VStack {
        CustomAction(
            style: CustomActionStyle.Icon(
                actionIcon: "star.fill", 
                action: { print("Click!") }
            )
        )
        CustomAction(
            style: CustomActionStyle.Text(
                actionText: "sdapoid",
                textStyle: TextStyle(
                    textColor: .blue, 
                    fontSize: 20.0,
                    fontWeight: .bold
                ),
                action: { print("Click2!") }
            )
        )
    }
}
