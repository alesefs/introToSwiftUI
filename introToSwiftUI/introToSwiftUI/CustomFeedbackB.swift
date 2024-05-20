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

struct CustomFeedback: View {
    var style: CustomFeedbackStyle
    var size: CustomFeedbackSize
    //var icon: String
    //var title: String
    //var description: String?
    //var action: (String, () -> Void)?
    
    var body: some View {
        switch size {
        case .Large(let showCard):
            CustomFeedbackLargeMedium(
                style: style.style,
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
    }
}

private struct CustomFeedbackLargeMedium: View {
    var style: CustomIconStyle
    var size: CustomFeedbackSizeName
    var showCard: Bool
    
    var body: some View {
        VStack(alignment: .center) {//MARK: muda
            CustomIcon(
                icon: "binoculars.fill",
                style: style,
                size: size == CustomFeedbackSizeName.large ? CustomIconSize.Large : CustomIconSize.Medium
            )
            
            Spacer().frame(width: .infinity, height: 8.0)//MARK: muda
            
            CustomFeedbackTexts(alignment: .center, textAlign: .center, size: size)
        }
        .padding(.vertical, 16.0)
        .frame(width: size == CustomFeedbackSizeName.large ? .infinity : 328 )//MARK: muda
        .if(showCard) { view in
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
                    decorated: CustomCardDecoration(size: 12.0, color: .blue)
                )
            )
        }
    }
}

private struct CustomFeedbackSmall: View {
    var style: CustomIconStyle
    var size: CustomFeedbackSizeName
    var showCard: Bool
    
    var body: some View {
        HStack(alignment: .top) {
            Spacer().frame(width: 8.0, height: .infinity, alignment: .leading)
            
            CustomIcon(
                icon: "binoculars.fill",
                style: style,
                size: .Medium
            )
            
            Spacer().frame(width: 8.0, height: .infinity, alignment: .leading)
            
            CustomFeedbackTexts(alignment: .leading, textAlign: .leading, size: size)
        }
        .frame(width: 328)
        .padding(.vertical, 16.0)
        .if(showCard) { view in
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
                    decorated: CustomCardDecoration(size: 12.0, color: .blue)
                )
            )
        }
    }
}

#Preview("CustomFeedback0") {
    VStack {
        CustomFeedback(style: CustomFeedbackStyle.Success, size: CustomFeedbackSize.Large(showCard: true))
    }
}


#Preview("CustomFeedbackA") {
    VStack {
        CustomFeedbackLargeMedium(
            style: CustomIconStyle.Error,
            size: CustomFeedbackSizeName.large,
            showCard: true
        )
        
        CustomFeedbackLargeMedium(
            style: CustomIconStyle.Success,
            size: CustomFeedbackSizeName.medium,
            showCard: true
        )
        
        CustomFeedbackSmall(
            style: CustomIconStyle.Neutral(showShape: true),
            size: CustomFeedbackSizeName.small,
            showCard: true
        )
    }
}

struct CustomFeedbackTexts: View {
    var alignment: HorizontalAlignment
    var textAlign: TextAlignment
    var size: CustomFeedbackSizeName
    
    var body: some View {
        VStack(alignment: alignment) {
            Text("The quick brown fox jumps over")
                .foregroundColor(.black)
                .lineLimit(2)
                .font(.system(size: size == CustomFeedbackSizeName.large ? 22 : 18 ))
                .multilineTextAlignment(textAlign)//MARK: muda
                .frame(width: .infinity)
            
            Spacer().frame(width: .infinity, height: 8)
            
            Text("He lands head first on a rotting maple log. " +
                 "Knocked unconscious, fox sleeps with shallow breath " +
                 "until the lazy dog awakes.")
            .foregroundColor(.gray)
            .lineLimit(5)
            .font(.system(size: size == CustomFeedbackSizeName.large ? 16 : 14 ))//MARK: muda
            .multilineTextAlignment(textAlign)//MARK: muda
            .frame(width: .infinity)
            
            Spacer().frame(height: 16)
            
            CustomAction(
                style: CustomActionStyle.Text(
                    actionText: "Text",
                    textStyle: TextStyle(
                        textColor: Color.teal,
                        fontSize: size == CustomFeedbackSizeName.large ? 16 : 14,
                        fontWeight: .semibold
                    ),
                    action: {
                        print("Click Text!")
                    }
                )
            )
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
