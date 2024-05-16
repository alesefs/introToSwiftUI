//
//  CustomCardView.swift
//  introToSwiftUI
//
//  Created by Alessandro Emanuel Ferreira de Souza on 15/05/24.
//

import SwiftUI

struct CustomCardView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CustomCardView()
}


//TODO: logica basica
/*
CustomCardViewStyle {
    Decorate(CustomCardDecoration)
 
    VerticalImage(String Image)
 
    HorizontalImage(String Image)
}
 
CustomCardView(
 style,
 cardStyle,
 //MARK: contentHeader
 //MARK: contentCenter
 //MARK: contentFooter
) {
 
    Zstack {
        switch(style) {
            case Decorate {
                VStack {
                     //MARK: contentHeader
                     //MARK: contentCenter
                     //MARK: contentFooter
                }
            }
 
            case VerticalImage {
                 VStack {
                      //MARK: contentHeader
                        Image(width: .infinity, height: 200.0)
                      //MARK: contentCenter
                      //MARK: contentFooter
                 }
            }
 
            case HorizontalImage {
                HStack {
                    Image(width: 120.0, height: .infitity)
 
                     VStack {
                          //MARK: contentHeader
                          //MARK: contentCenter
                          //MARK: contentFooter
                     }
                }
            }
        }
 
    }.modifier(
        CustomCard(...)
    )
 
 }
 
 contentHeader(
    icon: String,
    title: String,
    descritpion: String?
    action: (String Image, (() -> Void)
 ){
    VStack {
        HStack {
            icon
            title
            action
        }
 
        description?
    }
 }
 
 contentCenter(
    pillList: List<CustomTextPill>?,
    overLine: String?
    title: String,
    descritpion: String?
    monetaryValue: String?,
    actionAlignment: Alignment.Vertical?
    action: (String Image, (() -> Void)
 ){
    HStack {
        VStack {
            pillList?
            overLine?
            title
            description?
            monetaryValue?
        }
 
        action(actionAlignment)?
    }
 }
 
 contentFooter(
    caption: String
    action: (String, (() -> Void)
 ){
    VStack {
        Divider
        caption
        action
    }
 }

*/
