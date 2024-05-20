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

protocol CustomActionButton : View {
    var action: () -> Void {get}
}

struct CustomActionButtonIcon: CustomActionButton {
    var actionIcon: String
    var action: () -> Void
    
    init(actionIcon: String, action: @escaping () -> Void) {
        self.actionIcon = actionIcon
        self.action = action
    }
    
    var body: some View {
        CustomIcon(
            icon: actionIcon,
            style: .Custom(
                shapeColor: .clear,
                iconColor: .red,
                showShape: false
            ),
            size: .Large
        ).onTapGesture {
            action()
        }
    }
}

#Preview("CustomActionButtonIcon") {
    CustomActionButtonIcon(actionIcon: "star.fill", action: { print("icon click!") })
}

struct CustomActionButtonText: CustomActionButton {
    var actionText: String
    var textStyle: TextStyle
    var action: () -> Void
    
    init(actionText: String, textStyle: TextStyle, action: @escaping () -> Void) {
        self.actionText = actionText
        self.textStyle = textStyle
        self.action = action
    }
    
    var body: some View {
        CustomActionText(
            text: actionText,
            style: textStyle
        )
//        .onTapGesture {
//            action()
//        }
    }
}

#Preview("CustomActionButtonIcon") {
    CustomActionButtonText(
        actionText: "text button",
        textStyle: TextStyle(
            textColor: .blue,
            fontSize: 22.0,
            fontWeight: .thin
        ),
        action: { print("text click!")}
    )
}

private struct CustomActionButtonUser: View {
    var selectButton: any CustomActionButton
    var textButton: CustomActionButtonText
    var iconButton: CustomActionButtonIcon
    
    init(selectButton: any CustomActionButton, textButton: CustomActionButtonText, iconButton: CustomActionButtonIcon) {
        self.selectButton = selectButton
        self.textButton = textButton
        self.iconButton = iconButton
    }
    
    var body: some View {
        var contentAsAnyView: AnyView { AnyView(selectButton) }
        
        VStack {
            contentAsAnyView
            
            textButton
            
            iconButton
        }
    }
}

#Preview("CustomActionButtonUser") {
    CustomActionButtonUser(
        selectButton: CustomActionButtonIcon(actionIcon: "arrow.left", action: { print("icon click! 1") }),
        textButton: CustomActionButtonText(
            actionText: "blue button",
            textStyle: TextStyle(
                textColor: .blue,
                fontSize: 22.0,
                fontWeight: .thin
            ),
            action: { print("text click! 2")}
        ),
        iconButton: CustomActionButtonIcon(actionIcon: "heart.fill", action: { print("icon click! 3") })
    )
}
