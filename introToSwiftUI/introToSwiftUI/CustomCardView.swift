//
//  CustomCardView.swift
//  introToSwiftUI
//
//  Created by Alessandro Emanuel Ferreira de Souza on 15/05/24.
//

import SwiftUI

enum CustomCardViewStyleName: Hashable {
    case Decorate, VerticalImage, HorizontalImage
}

enum CustomCardViewStyle: Hashable {
    case Decorate(
        decoration: CustomCardDecoration = CustomCardDecoration(size: 12, color: .blue)
    )
    
    case VerticalImage(
        image: String = "binoculars.fill"
    )
    
    case HorizontalImage(
        image: String = "binoculars.fill"
    )
    
    var style: CustomCardViewStyleName {
        switch self {
        case .Decorate(_):
            return .Decorate
        case .VerticalImage(_):
            return .VerticalImage
        case .HorizontalImage(_):
            return .HorizontalImage
        }
    }
}

struct CustomCardView: View {
    var style: CustomCardViewStyle
    var customCardStyle: CustomCardStyle
    var customCardViewHeader: CustomCardViewHeader
    
//    init(style: CustomCardViewStyle, customCardStyle: CustomCardStyle) {
//        self.style = style
//        self.customCardStyle = customCardStyle
//    }
    
    init(style: CustomCardViewStyle, customCardStyle: CustomCardStyle, customCardViewHeader: CustomCardViewHeader) {
        self.style = style
        self.customCardStyle = customCardStyle
        self.customCardViewHeader = customCardViewHeader
    }
    
    var body: some View {
        switch style {
        case .Decorate(let decoration):
            VStack {
//                CustomCardViewHeader(
//                    title: "Lorem ipsum dolor sit amet, Nullam lorem eros, pretium eu dui sit amet, elementum sagittis justo.  In consectetur nec nunc nec tristique",
//                    icon: "star",
//                    description: "Lorem ipsum dolor sit amet, Nullam lorem eros, pretium eu dui sit amet, elementum sagittis justo.  In consectetur nec nunc nec tristique",
//                    action: CustomActionStyle.Icon(
//                        actionIcon: "binoculars.fill",
//                        action: {
//                            print("Click Icon!")
//                        }
//                    )
//                )
                
                customCardViewHeader
                
                CustomCardViewCenter(
                    title: "Lorem ipsum dolor sit amet, Nullam lorem eros, pretium eu dui sit amet",
                    pillList: textPillList,
                    overLine: "Lorem ipsum dolor sit amet",
                    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. " +
                                    "Suspendisse in neque maximus, tempus lectus in, maximus odio. " +
                                    "Etiam blandit diam at metus semper rutrum. Integer cursus mauris vel neque elementum vehicula.",
                    monetaryValue: "R$ 100,70",
                    actionAlignment: .center,
                    action: CustomActionStyle.Icon(
                        actionIcon: "arrow.right",
                        action: {
                            print("Click Icon!")
                        }
                    )
                )
                CustomCardViewBottom(
                    caption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. " +
                        "Suspendisse in neque maximus, tempus lectus in, maximus odio. " +
                        "Etiam blandit diam at metus semper rutrum. Integer cursus mauris vel neque elementum vehicula.",
                    action: CustomActionStyle.Text(
                        actionText: "Text",
                        textStyle: TextStyle(
                            textColor: .red,
                            fontSize: 16.0,
                            fontWeight: .semibold
                        ),
                        action: {
                            print("Click Text!")
                        }
                    )
                )
            }
            .modifier(
                CustomCard(
                    style: customCardStyle,
                    decorated: decoration
                )
            )
        case .VerticalImage(let image):
            VStack {
                CustomCardViewHeader(
                    title: "Lorem ipsum dolor sit amet, Nullam lorem eros, pretium eu dui sit amet, elementum sagittis justo.  In consectetur nec nunc nec tristique",
                    icon: "star",
                    description: "Lorem ipsum dolor sit amet, Nullam lorem eros, pretium eu dui sit amet, elementum sagittis justo.  In consectetur nec nunc nec tristique",
                    action: CustomActionStyle.Icon(
                        actionIcon: "binoculars.fill",
                        action: {
                            print("Click Icon!")
                        }
                    )
                )
                Image(image)
                    .resizable()
                    .aspectRatio(
                        contentMode: .fit
                    )
                    .frame(height: 200.0)
                CustomCardViewCenter(
                    title: "Lorem ipsum dolor sit amet, Nullam lorem eros, pretium eu dui sit amet",
                    pillList: textPillList,
                    overLine: "Lorem ipsum dolor sit amet",
                    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. " +
                                    "Suspendisse in neque maximus, tempus lectus in, maximus odio. " +
                                    "Etiam blandit diam at metus semper rutrum. Integer cursus mauris vel neque elementum vehicula.",
                    monetaryValue: "R$ 100,70",
                    actionAlignment: .center,
                    action: CustomActionStyle.Icon(
                        actionIcon: "arrow.right",
                        action: {
                            print("Click Icon!")
                        }
                    )
                )
                CustomCardViewBottom(
                    caption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. " +
                        "Suspendisse in neque maximus, tempus lectus in, maximus odio. " +
                        "Etiam blandit diam at metus semper rutrum. Integer cursus mauris vel neque elementum vehicula.",
                    action: CustomActionStyle.Text(
                        actionText: "Text",
                        textStyle: TextStyle(
                            textColor: .red,
                            fontSize: 16.0,
                            fontWeight: .semibold
                        ),
                        action: {
                            print("Click Text!")
                        }
                    )
                )
            }
            .modifier(
                CustomCard(
                    style: customCardStyle
                )
            )
        case .HorizontalImage(let image):
            HStack {
                Image(image)
                    .resizable()
                    .aspectRatio(
                        contentMode: .fit
                    )
                    .frame(width: 120)
                VStack {
                    CustomCardViewHeader(
                        title: "Lorem ipsum dolor sit amet, Nullam lorem eros, pretium eu dui sit amet, elementum sagittis justo.  In consectetur nec nunc nec tristique",
                        icon: "star",
                        description: "Lorem ipsum dolor sit amet, Nullam lorem eros, pretium eu dui sit amet, elementum sagittis justo.  In consectetur nec nunc nec tristique",
                        action: CustomActionStyle.Icon(
                            actionIcon: "binoculars.fill",
                            action: {
                                print("Click Icon!")
                            }
                        )
                    )
                    CustomCardViewCenter(
                        title: "Lorem ipsum dolor sit amet, Nullam lorem eros, pretium eu dui sit amet",
                        pillList: textPillList,
                        overLine: "Lorem ipsum dolor sit amet",
                        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. " +
                                        "Suspendisse in neque maximus, tempus lectus in, maximus odio. " +
                                        "Etiam blandit diam at metus semper rutrum. Integer cursus mauris vel neque elementum vehicula.",
                        monetaryValue: "R$ 100,70",
                        actionAlignment: .center,
                        action: CustomActionStyle.Icon(
                            actionIcon: "arrow.right",
                            action: {
                                print("Click Icon!")
                            }
                        )
                    )
                    CustomCardViewBottom(
                        caption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. " +
                            "Suspendisse in neque maximus, tempus lectus in, maximus odio. " +
                            "Etiam blandit diam at metus semper rutrum. Integer cursus mauris vel neque elementum vehicula.",
                        action: CustomActionStyle.Text(
                            actionText: "Text",
                            textStyle: TextStyle(
                                textColor: .red,
                                fontSize: 16.0,
                                fontWeight: .semibold
                            ),
                            action: {
                                print("Click Text!")
                            }
                        )
                    )
                }
            }
            .modifier(
                CustomCard(
                    style: customCardStyle
                )
            )
        }
    }
}

#Preview("CustomCardViewDecorate") {
    CustomCardView(
        style: CustomCardViewStyle.Decorate(decoration: CustomCardDecoration(size: 12, color: .orange)),
        customCardStyle: CustomCardStyle.Base(cardRadius: CustomCardCornerRadius(radius: 16, topLeading: true, topTrailing: true, bottomLeading: false, bottomTrailing: true)),
        customCardViewHeader: CustomCardViewHeader(
                                    title: "Lorem ipsum dolor sit amet, Nullam lorem eros, pretium eu dui sit amet, elementum sagittis justo.  In consectetur nec nunc nec tristique",
                                    icon: "star",
                                    description: "Lorem ipsum dolor sit amet, Nullam lorem eros, pretium eu dui sit amet, elementum sagittis justo.  In consectetur nec nunc nec tristique",
                                    action: CustomActionStyle.Icon(
                                        actionIcon: "binoculars.fill",
                                        action: {
                                            print("Click Icon!")
                                        }
                                    )
                                )
    )
}

#Preview("CustomCardViewVerticalImage") {
    CustomCardView(
        style: CustomCardViewStyle.VerticalImage(image: "london"),
        customCardStyle: CustomCardStyle.Base(cardRadius: CustomCardCornerRadius(radius: 16, topLeading: true, topTrailing: true, bottomLeading: false, bottomTrailing: true)),
        customCardViewHeader: CustomCardViewHeader(
                                    title: "Lorem ipsum dolor sit amet, Nullam lorem eros, pretium eu dui sit amet, elementum sagittis justo.  In consectetur nec nunc nec tristique",
                                    icon: "star",
                                    description: "Lorem ipsum dolor sit amet, Nullam lorem eros, pretium eu dui sit amet, elementum sagittis justo.  In consectetur nec nunc nec tristique",
                                    action: CustomActionStyle.Icon(
                                        actionIcon: "binoculars.fill",
                                        action: {
                                            print("Click Icon!")
                                        }
                                    )
                                )
    )
}

#Preview("CustomCardViewHorizontalImage") {
    CustomCardView(
        style: CustomCardViewStyle.HorizontalImage(image: "toronto"),
        customCardStyle: CustomCardStyle.Base(cardRadius: CustomCardCornerRadius(radius: 16, topLeading: true, topTrailing: true, bottomLeading: false, bottomTrailing: true)),
        customCardViewHeader: CustomCardViewHeader(
                                    title: "Lorem ipsum dolor sit amet, Nullam lorem eros, pretium eu dui sit amet, elementum sagittis justo.  In consectetur nec nunc nec tristique",
                                    icon: "star",
                                    description: "Lorem ipsum dolor sit amet, Nullam lorem eros, pretium eu dui sit amet, elementum sagittis justo.  In consectetur nec nunc nec tristique",
                                    action: CustomActionStyle.Icon(
                                        actionIcon: "binoculars.fill",
                                        action: {
                                            print("Click Icon!")
                                        }
                                    )
                                )
    )
}


struct CustomCardViewHeader: View {
    var title: String
    var icon: String
    var description: String?
    var action: CustomActionStyle?
    
    init(title: String, icon: String, description: String? = nil, action: CustomActionStyle? = nil) {
        self.title = title
        self.icon = icon
        self.description = description
        self.action = action
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                CustomIcon(
                    icon: icon,
                    style: .Custom(
                        shapeColor: .clear,
                        iconColor: .darkGray,
                        showShape: false
                    ),
                    size: .Large
                )
                
                Spacer().frame(width: 8.0)
                
                Text(title)
                    .lineLimit(2)
                    .truncationMode(.tail)
                    .multilineTextAlignment(TextAlignment.leading)
                    .frame(width: .infinity)
                    .font(.system(size: 18.0))
                    .foregroundColor(.darkGray)
                
                Spacer().frame(width: 8.0)
                
                if let actionIcon = action {
                    switch actionIcon {
                    case .Icon(let actionIcon, let action):
                        CustomAction(
                            style: CustomActionStyle.Icon(
                                actionIcon: actionIcon,
                                action: { action() }
                            )
                        )
                    case .Text(let actionText, let textStyle, let action):
                        CustomAction(
                            style: CustomActionStyle.Text(
                                actionText: actionText,
                                textStyle: textStyle,
                                action: { action() }
                            )
                        )
                    }
                }
            }
            
            Spacer().frame(height: 8.0)
            
            if let textDescription = description {
                Text(textDescription)
                    .lineLimit(5)
                    .truncationMode(.tail)
                    .multilineTextAlignment(TextAlignment.leading)
                    .frame(width: .infinity)
                    .font(.system(size: 14.0))
                    .foregroundColor(.gray)
            }
            
        }
        .frame(width: .infinity)
        .padding(.all, 8.0)
    }
}

#Preview("CustomCardViewHeader") {
    CustomCardViewHeader(
        title: "Lorem ipsum dolor sit amet, Nullam lorem eros, pretium eu dui sit amet, elementum sagittis justo.  In consectetur nec nunc nec tristique",
        icon: "star",
        description: "Lorem ipsum dolor sit amet, Nullam lorem eros, pretium eu dui sit amet, elementum sagittis justo.  In consectetur nec nunc nec tristique",
        action: CustomActionStyle.Icon(
            actionIcon: "binoculars.fill",
            action: {
                print("Click Icon!")
            }
        )
    )
}

struct CustomCardViewCenter: View {
    var title: String
    var pillList: [CustomTextPillModel]?
    var overLine: String?
    var description: String?
    var monetaryValue: String?
    var actionAlignment: VerticalAlignment?
    var action: CustomActionStyle?
    
    init(title: String, pillList: [CustomTextPillModel]? = nil, overLine: String? = nil, description: String? = nil, monetaryValue: String? = nil, actionAlignment: VerticalAlignment? = nil, action: CustomActionStyle? = nil) {
        self.title = title
        self.pillList = pillList
        self.overLine = overLine
        self.description = description
        self.monetaryValue = monetaryValue
        self.actionAlignment = actionAlignment
        self.action = action
    }
    
    var body: some View {
        
        HStack(alignment: actionAlignment ?? .center) {
            
            VStack(alignment: .leading) {
                
                if let pillListItems = pillList {
                    HStack(alignment: .top) {
                        ForEach(pillListItems, id: \.self) { item in
                            CustomTextPill(
                                text: item.text,
                                isFilled: item.isFilled,
                                style: item.style
                            )
                        }
                    }
                }
                
                if let textOverLine = overLine {
                    Text(textOverLine)
                        .foregroundColor(.gray)
                        .font(.system(size: 12.0))
                        .truncationMode(.tail)
                        .lineLimit(1)
                        .multilineTextAlignment(.leading)
                        .frame(width: .infinity)
                        .textCase(.uppercase)
                    
                    Spacer().frame(height: 8.0)
                }
                
                Text(title)
                    .lineLimit(2)
                    .truncationMode(.tail)
                    .multilineTextAlignment(TextAlignment.leading)
                    .frame(width: .infinity)
                    .font(.system(size: 16.0))
                    .foregroundColor(.darkGray)
                
                if let textDescription = description {
                    Spacer().frame(height: 8.0)
                    
                    Text(textDescription)
                        .lineLimit(5)
                        .truncationMode(.tail)
                        .multilineTextAlignment(TextAlignment.leading)
                        .frame(width: .infinity)
                        .font(.system(size: 14.0))
                        .foregroundColor(.gray)
                }
                
                if let textMonetaryValue = monetaryValue {
                    Spacer().frame(height: 8.0)
                    
                    CustomTextValues(
                        value: textMonetaryValue,
                        style: .Dark,
                        showValue: true
                    )
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            if let textAction = action {
                Spacer().frame(width: 8.0)
                
                CustomAction(
                    style: CustomActionStyle.Icon(
                        actionIcon: textAction.actionIcon!,
                        action: { textAction.action() }
                    )
                )
                .frame(width: 24.0, height: 24.0)
            }
            
        }
        .padding(.all, 8.0)
    }
}

var textPillList: [CustomTextPillModel] {
    return [
        CustomTextPillModel(text: "Texto 1", isFilled: true, style: .neutral),
        CustomTextPillModel(text: "Texto 2", isFilled: true, style: .neutral),
        CustomTextPillModel(text: "Texto 3", isFilled: false, style: .neutral),
//        CustomTextPillModel(text: "Texto 4", isFilled: true, style: .neutral),
//        CustomTextPillModel(text: "Texto 5", isFilled: true, style: .neutral),
    ]
}

#Preview("CustomCardViewCenter") {
    CustomCardViewCenter(
        title: "Lorem ipsum dolor sit amet, Nullam lorem eros, pretium eu dui sit amet",
        pillList: textPillList,
        overLine: "Lorem ipsum dolor sit amet",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. " +
                        "Suspendisse in neque maximus, tempus lectus in, maximus odio. " +
                        "Etiam blandit diam at metus semper rutrum. Integer cursus mauris vel neque elementum vehicula.",
        monetaryValue: "R$ 100,70",
        actionAlignment: .center,
        action: CustomActionStyle.Icon(
            actionIcon: "arrow.right",
            action: {
                print("Click Icon!")
            }
        )
    )
}

struct CustomCardViewBottom: View {
    var caption: String
    var action: CustomActionStyle?
    
    init(caption: String, action: CustomActionStyle? = nil) {
        self.caption = caption
        self.action = action
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Divider()
            
            Spacer().frame(height: 8.0)

            Text(caption)
                .foregroundColor(.gray)
                .font(.system(size: 12.0))
                .truncationMode(.tail)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .frame(width: .infinity)
            
            if let textAction = action {
                Spacer().frame(height: 8.0)
                
                CustomAction(
                    style: CustomActionStyle.Text(
                        actionText: textAction.actionText!,
                        textStyle: textAction.textStyle!,
                        action: { textAction.action() }
                    )
                )
            }
            
        }
        .padding(.all, 8.0)
    }
}

#Preview("CustomCardViewBottom") {
    CustomCardViewBottom(
        caption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. " +
            "Suspendisse in neque maximus, tempus lectus in, maximus odio. " +
            "Etiam blandit diam at metus semper rutrum. Integer cursus mauris vel neque elementum vehicula.",
        action: CustomActionStyle.Text(
            actionText: "Text",
            textStyle: TextStyle(
                textColor: .red,
                fontSize: 16.0,
                fontWeight: .semibold
            ),
            action: {
                print("Click Text!")
            }
        )
    )
}

/*
 protocol CustomViewHeader : View {
     var title: String {get}
     var icon: String {get}
     var description: String? {get}
     var action: CustomActionStyle? {get}
 }
 
 struct CustomViewMonetaryHeader: CustomViewHeader {
     var title: String {get}
     var icon: String {get}
     var description: String? {get}
     var action: CustomActionStyle? {get}
     var monetaryValue: CustomTextValues{get}
 }
 
 struct SimpleHeader: CustomViewHeader {
      var title: String
      var icon: String
      var description: String?
      var action: CustomActionStyle?

      var body: some View { ... }
 }
 
 struct TestView: View {
    var header: CustomViewHeader
 
    var body: some View {
         VStack {
             Text(header.title)
 
             //proriedades unicas
             if let customHeaderMonetary = header as? CustomViewMonetaryHeader {
                 CustomTextValue(value: customHeaderMonetary.monetaryValue)
             }
        }
    }
 }
 */
 

