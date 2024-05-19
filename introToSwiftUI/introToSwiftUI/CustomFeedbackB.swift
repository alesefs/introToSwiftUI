//
//  CustomFeedbackB.swift
//  introToSwiftUI
//
//  Created by Alessandro Emanuel Ferreira de Souza on 18/05/24.
//

import SwiftUI

/*
//mudanças
spacer icon-title | L, M = H16, Wfill | S = W8, Hfill
Title fontSize | L = 22, M, S = 18
Description | L 18 | M, S = 14

Title+Descriptiion+Action textAlign | L, M = center | S = leading
VStack content Align | L, M = center | S = leading
*/


struct CustomFeedbackB: View {
    var body: some View {
        VStack(alignment: .center) {//MARK: muda
            CustomIcon(
                icon: "binoculars.fill",
                style: CustomIconStyle.Success,
                size: CustomIconSize.Large
            )
            
            Spacer().frame(width: .infinity, height: 16.0)//MARK: muda
            
            Text("The quick brown fox jumps over")
                .foregroundColor(.black)
                .font(.system(size: 22))//MARK: muda
                .multilineTextAlignment(.center)//MARK: muda
                .frame(width: .infinity)
                
            Spacer().frame(width: .infinity, height: 8)
                
            Text("He lands head first on a rotting maple log.\n" +
                 "Knocked unconscious, fox sleeps with shallow breath\n" +
                 "until the lazy dog awakes.")
                .foregroundColor(.gray)
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

struct CustomFeedbackC: View {
    var body: some View {
        VStack(alignment: .center) {//MARK: muda
            CustomIcon(
                icon: "binoculars.fill",
                style: CustomIconStyle.Success,
                size: CustomIconSize.Large
            )
            
            Spacer().frame(width: .infinity, height: 16.0)//MARK: muda
            
            Text("The quick brown fox jumps over")
                .foregroundColor(.black)
                .font(.system(size: 22))//MARK: muda
                .multilineTextAlignment(.center)//MARK: muda
                .frame(width: .infinity)
                
            Spacer().frame(width: .infinity, height: 8)
                
            Text("He lands head first on a rotting maple log.\n" +
                 "Knocked unconscious, fox sleeps with shallow breath\n" +
                 "until the lazy dog awakes.")
                .foregroundColor(.gray)
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
        .frame(width: 328.0)
        .padding(.horizontal, 16.0)
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
                decorated: CustomCardDecoration(size: 12.0, color: .blue)
            )
        )
    }
}

#Preview("CustomFeedbackC") {
    CustomFeedbackC()
}
