//
//  CustomFeedbackB.swift
//  introToSwiftUI
//
//  Created by Alessandro Emanuel Ferreira de Souza on 18/05/24.
//

import SwiftUI

/*
 TODO: melhorar sistema de "pegar nome" para trabalhar if/switch das subclasses dentro dos enums, como: sizes e styles
 */

enum FeedbackStyle {
    case Success, Error, Warning, Waiting, Info
    
    var iconStyle: CustomIconStyle {
        switch self {
        case .Success:
                .Success
        case .Error:
                .Error
        case .Warning:
                .Warning
        case .Waiting:
                .Neutral(showShape: true)
        case .Info:
                .Info
        }
    }
    
    var decorateColor: Color {
        switch self {
        case .Success:
                .green
        case .Error:
                .red
        case .Warning:
                .yellow
        case .Waiting:
                .gray
        case .Info:
                .blue
        }
    }
}

//enum FeedbackSize {
//    case Large, Medium, Small
//}

enum FeedbackSize: Equatable {
    case Large, Medium(showCard: Bool), Small(showCard: Bool)
}

struct CustomFeedback: View {
    var style: FeedbackStyle
    var size: FeedbackSize
//    var showCard: Bool
    //var icon: String
    //var title: String
    //var description: String?
    var action: (() -> Void)
    
    /*var body: some View {
        switch size {
        case .Large:
            CustomFeedbackLargeMedium(
                style: style.iconStyle,
                size: size.size,
                showCard: showCard
            )
        case .Medium(let showCard):
            CustomFeedbackLargeMedium(
                style: style.style,
                size: size.size,
                showCard: showCard
            )
        case .Small(let showCard):
            CustomFeedbackSmall(
                style: style.style,
                size: size.size,
                showCard: showCard
            )
        }
    }*/
    
    /*
    var body: some View {
        switch size {
        case .Large:
            CustomFeedbackLargeMedium(
                style: style,
                size: size,
                showCard: showCard
            )
        case .Medium:
            CustomFeedbackLargeMedium(
                style: style,
                size: size,
                showCard: showCard
            )
        case .Small:
            CustomFeedbackSmall(
                style: style,
                size: size,
                showCard: showCard
            )
        }
    }
     */
    
    var body: some View {
        switch size {
        case .Large:
            CustomFeedbackLargeMedium(
                style: style,
                size: size,
                action: action
            )
        case .Medium(_):
            CustomFeedbackLargeMedium(
                style: style,
                size: size,
                action: action
            )
        case .Small(_):
            CustomFeedbackSmall(
                style: style,
                size: size,
                action: action
            )
        }
    }
}

private struct CustomFeedbackLargeMedium: View {
    var style: FeedbackStyle
    var size: FeedbackSize
    var action: (() -> Void)
    
    var body: some View {
        
        VStack(alignment: .center) {//MARK: muda
            CustomIcon(
                icon: "binoculars.fill",
                style: style.iconStyle,
                size: size == FeedbackSize.Large ? CustomIconSize.Large : CustomIconSize.Medium
            )
            
            Spacer().frame(width: .infinity, height: 8.0)//MARK: muda
            
            CustomFeedbackTexts(alignment: .center, textAlign: .center, size: size, action: action)
        }
        .padding(.vertical, 16.0)
        .frame(width: size == FeedbackSize.Large ? .infinity : 328 )//MARK: muda
        .if(showCard(size: size)) { view in
            view.modifier(
                CustomCard(
                    style: CustomCardStyle.Base(
                        cardRadius: CustomCardCornerRadius(
                            radius: 16.0,
                            topLeading: true,
                            topTrailing: true,
                            bottomLeading: true,
                            bottomTrailing: true
                        )
                    ),
                    decorated: CustomCardDecoration(size: 12.0, color: style.decorateColor)
                )
            )
        }
    }
}

private struct CustomFeedbackSmall: View {
    var style: FeedbackStyle
    var size: FeedbackSize
    var action: (() -> Void)

    var body: some View {
        HStack(alignment: .top) {
            Spacer().frame(width: 8.0, height: .infinity, alignment: .leading)
            
            CustomIcon(
                icon: "binoculars.fill",
                style: style.iconStyle,
                size: .Medium
            )
            
            Spacer().frame(width: 8.0, height: .infinity, alignment: .leading)
            
            CustomFeedbackTexts(alignment: .leading, textAlign: .leading, size: size, action: action)
        }
        .frame(width: 328)
        .padding(.vertical, 16.0)
        .if(showCard(size: size)) { view in
            view.modifier(
                CustomCard(
                    style: CustomCardStyle.Base(
                        cardRadius: CustomCardCornerRadius(
                            radius: 14.0,
                            topLeading: true,
                            topTrailing: true,
                            bottomLeading: true,
                            bottomTrailing: true
                        )
                    ),
                    decorated: CustomCardDecoration(size: 12.0, color: style.decorateColor)
                )
            )
        }
    }
}

struct CustomFeedbackTexts: View {
    var alignment: HorizontalAlignment
    var textAlign: TextAlignment
    var size: FeedbackSize
    var action: (() -> Void)
    
    var body: some View {
        VStack(alignment: alignment) {
            Text("The quick brown fox jumps over")
                .foregroundColor(.black)
                .lineLimit(2)
                .font(.system(size: size == FeedbackSize.Large ? 22 : 18 ))
                .multilineTextAlignment(textAlign)//MARK: muda
                .frame(width: .infinity)
            
            Spacer().frame(width: .infinity, height: 8)
            
            Text("He lands head first on a rotting maple log. " +
                 "Knocked unconscious, fox sleeps with shallow breath " +
                 "until the lazy dog awakes.")
            .foregroundColor(.gray)
            .lineLimit(5)
            .font(.system(size: size == FeedbackSize.Large ? 16 : 14 ))//MARK: muda
            .multilineTextAlignment(textAlign)//MARK: muda
            .frame(width: .infinity)
            
            Spacer().frame(height: 16)
            
            CustomAction(
                style: CustomActionStyle.Text(
                    actionText: "Click",
                    textStyle: TextStyle(
                        textColor: Color.teal,
                        fontSize: size == FeedbackSize.Large ? 16 : 14,
                        fontWeight: .semibold
                    ),
                    action: { action() }
                )
            )
        }
    }
}

func showCard(size: FeedbackSize) -> Bool {
    switch size {
        case .Medium(let showCard), .Small(let showCard):
            showCard
        default:
            false
    }
}

#Preview("CustomFeedback0") {
    VStack {
        @State var showCard: Bool = true
        
        CustomFeedback(
            style: FeedbackStyle.Success,
            size: FeedbackSize.Medium(showCard: showCard),
            action: {
                showCard.toggle()
            }
        )
    }
}

//struct ContentViewW_Previews: PreviewProvider {
//    @State var showCard: Bool = true
//    @State var count: Int = 0
//    
//    static var previews: some View {
//        
//        
//        VStack {
//            CustomFeedbackLargeMedium(
//                style: FeedbackStyle.Error,
//                size: FeedbackSize.Large
//            ){
//                count += 1
//                print("click \(count)")
//            }
//            
//            CustomFeedbackLargeMedium(
//                style: FeedbackStyle.Success,
//                size: FeedbackSize.Medium(showCard: showCard)
//            ){
//                showCard.toggle()
//            }
//            
//            CustomFeedbackSmall(
//                style: FeedbackStyle.Waiting,
//                size: FeedbackSize.Small(showCard: showCard)
//            ){
//                showCard.toggle()
//            }
//        }
//    }
//}

struct ContentViewW: View {
    
    @State var showCard: Bool = true
    @State var count: Int = 0
    
    var body: some View {
        VStack {
            CustomFeedbackLargeMedium(
                style: FeedbackStyle.Error,
                size: FeedbackSize.Large
            ){
                count += 1
                print("click \(count)")
            }

            CustomFeedbackLargeMedium(
                style: FeedbackStyle.Success,
                size: FeedbackSize.Medium(showCard: showCard)
            ){
                showCard.toggle()
            }

            CustomFeedbackSmall(
                style: FeedbackStyle.Waiting,
                size: FeedbackSize.Small(showCard: showCard)
            ){
                showCard.toggle()
            }
        }
    }
}

#Preview("ContentViewW") {
    ContentViewW()
}

#Preview("CustomFeedbackA") {
    VStack {
        @State var showCard: Bool = true
        @State var clickLarge: Int = 0
        
        CustomFeedbackLargeMedium(
            style: FeedbackStyle.Error,
            size: FeedbackSize.Large
        ){
            clickLarge += 1
            print("click \(clickLarge)")
        }
        
        CustomFeedbackLargeMedium(
            style: FeedbackStyle.Success,
            size: FeedbackSize.Medium(showCard: showCard)
        ){
            showCard.toggle()
        }
        
        CustomFeedbackSmall(
            style: FeedbackStyle.Waiting,
            size: FeedbackSize.Small(showCard: showCard)
        ){
            showCard.toggle()
        }
    }
}

//======================


private struct CustomFeedbackB: View {
    var body: some View {
        VStack(alignment: .center) {//MARK: muda
            CustomIcon(
                icon: "binoculars.fill",
                style: CustomIconStyle.Success,
                size: CustomIconSize.Large
            )
            
            Spacer().frame(width: .infinity, height: 8.0)//MARK: muda
            
            Text("The quick brown fox jumps over")
                .foregroundColor(.black)
                .lineLimit(2)
                .font(.system(size: 22))//MARK: muda
                .multilineTextAlignment(.center)//MARK: muda
                .frame(width: .infinity)
            
            Spacer().frame(width: .infinity, height: 8)
            
            Text("He lands head first on a rotting maple log. " +
                 "Knocked unconscious, fox sleeps with shallow breath " +
                 "until the lazy dog awakes.")
            .foregroundColor(.gray)
            .lineLimit(5)
            .font(.system(size: 16))//MARK: muda
            .multilineTextAlignment(.center)//MARK: muda
            .frame(width: .infinity)
            
            Spacer().frame(height: 16)
            
            CustomAction(
                style: CustomActionStyle.Text(
                    actionText: "Text",
                    textStyle: TextStyle(
                        textColor: Color.teal,
                        fontSize: 16.0,
                        fontWeight: .semibold
                    ),
                    action: {
                        print("Click Text!")
                    }
                )
            )
        }
        .padding(.vertical, 16.0)
        .frame(width: .infinity)//MARK: muda
        .modifier(
            CustomCard(
                style: CustomCardStyle.Base(
                    cardRadius: CustomCardCornerRadius(
                        radius: 16.0,
                        topLeading: true,
                        topTrailing: true,
                        bottomLeading: true,
                        bottomTrailing: true
                    )
                ),
                decorated: CustomCardDecoration(size: 12.0, color: .blue)
            )
        )
    }
}

#Preview("CustomFeedbackB") {
    CustomFeedbackB()
}

private struct CustomFeedbackC: View {
    var body: some View {
        VStack(alignment: .center) {//MARK: muda
            CustomIcon(
                icon: "binoculars.fill",
                style: CustomIconStyle.Success,
                size: CustomIconSize.Medium
            )
            
            Spacer().frame(width: 328.0, height: 8.0)//MARK: muda
            
            Text("The quick brown fox jumps over")
                .foregroundColor(.black)
                .lineLimit(2)
                .font(.system(size: 18))//MARK: muda
                .multilineTextAlignment(.center)//MARK: muda
                .frame(width: .infinity)
            
            Spacer().frame(width: .infinity, height: 8)
            
            Text("He lands head first on a rotting maple log. " +
                 "Knocked unconscious, fox sleeps with shallow breath " +
                 "until the lazy dog awakes.")
            .foregroundColor(.gray)
            .lineLimit(5)
            .font(.system(size: 14))//MARK: muda
            .multilineTextAlignment(.center)//MARK: muda
            .frame(width: .infinity)
            
            Spacer().frame(height: 8.0)
            
            CustomAction(
                style: CustomActionStyle.Text(
                    actionText: "Text",
                    textStyle: TextStyle(
                        textColor: Color.teal,
                        fontSize: 14.0,
                        fontWeight: .semibold
                    ),
                    action: {
                        print("Click Text!")
                    }
                )
            )
        }
        .padding(.vertical, 16.0)
        .frame(width: 328.0)//MARK: muda
        .modifier(
            CustomCard(
                style: CustomCardStyle.Base(
                    cardRadius: CustomCardCornerRadius(
                        radius: 16.0,
                        topLeading: true,
                        topTrailing: true,
                        bottomLeading: true,
                        bottomTrailing: true
                    )
                ),
                decorated: CustomCardDecoration(size: 12.0, color: .red)
            )
        )
    }
}

#Preview("CustomFeedbackC") {
    CustomFeedbackC()
}

private struct CustomFeedbackD: View {
    var body: some View {
        HStack(alignment: .top) {
            Spacer().frame(width: 8.0, height: .infinity, alignment: .leading)
            
            CustomIcon(
                icon: "binoculars.fill",
                style: .Error,
                size: .Medium
            )
            
            Spacer().frame(width: 8.0, height: .infinity, alignment: .leading)
            
            VStack(alignment: .leading) {
                Text("The quick brown fox jumps over")
                    .foregroundColor(.black)
                    .lineLimit(2)
                    .font(.system(size: 18))//MARK: muda
                    .multilineTextAlignment(.leading)//MARK: muda
                    .frame(width: .infinity)
                
                Spacer().frame(width: .infinity, height: 8)
                
                Text("He lands head first on a rotting maple log. " +
                     "Knocked unconscious, fox sleeps with shallow breath " +
                     "until the lazy dog awakes.")
                .foregroundColor(.gray)
                .lineLimit(5)
                .font(.system(size: 14))//MARK: muda
                .multilineTextAlignment(.leading)//MARK: muda
                .frame(width: .infinity)
                
                Spacer().frame(height: 8.0)
                
                CustomAction(
                    style: CustomActionStyle.Text(
                        actionText: "Text",
                        textStyle: TextStyle(
                            textColor: Color.teal,
                            fontSize: 14.0,
                            fontWeight: .semibold
                        ),
                        action: {
                            print("Click Text!")
                        }
                    )
                )
            }
        }
        .frame(width: 328)
        .padding(.vertical, 16.0)
        .modifier(
            CustomCard(
                style: CustomCardStyle.Base(
                    cardRadius: CustomCardCornerRadius(
                        radius: 16.0,
                        topLeading: true,
                        topTrailing: true,
                        bottomLeading: true,
                        bottomTrailing: true
                    )
                ),
                decorated: CustomCardDecoration(size: 12.0, color: .yellow)
            )
        )
    }
}

#Preview("CustomFeedbackD") {
    CustomFeedbackD()
}


#Preview("CustomFeedbackBCD") {
    VStack(spacing: 0.0) {
        CustomFeedbackB()
        CustomFeedbackC()
        CustomFeedbackD()
    }
}
