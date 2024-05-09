//
//  CustomCard.swift
//  introToSwiftUI
//
//  Created by Alessandro Emanuel Ferreira de Souza on 08/05/24.
//

import SwiftUI

struct CustomCard: View {
    var body: some View {
//        VStack(alignment: .leading) {
//            Image("toronto")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .cornerRadius(15)
//        }
//        .background(
//            Rectangle()
//                .foregroundColor(.white)
//                .cornerRadius(15)
//                .overlay(
//                    RectangleCornerRadii()
//                    RoundedRectangle(cornerRadius: 15).stroke(.blue, lineWidth: 2.0)
//                )
//                .shadow(radius: 15)
            
        ZStack {
            UnevenRoundedRectangle(
                topLeadingRadius: 20,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 20,
                topTrailingRadius: 0
            )
            .foregroundStyle(.orange.gradient)
            //            .overlay(
            //                UnevenRoundedRectangle(
            //                    cornerRadii: RectangleCornerRadii(
            //                        topLeading: 20,
            //                        bottomLeading: 20,
            //                        bottomTrailing: 20,
            //                        topTrailing: 20
            //                    )
            //                ).stroke(.blue, lineWidth: 4.0)
            //            )
            .overlay(
                Text("DevTechie.com").font(.largeTitle)
            )
            .padding()
            .shadow(radius: 15)
            
//            UnevenRoundedRectangle(
//                topLeadingRadius: 20,
//                bottomLeadingRadius: 0,
//                bottomTrailingRadius: 20,
//                topTrailingRadius: 0
//            ).path(in: CGRect)
            
        }
    }
}

#Preview {
    CustomCard()
}
