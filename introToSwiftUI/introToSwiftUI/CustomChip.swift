//
//  CustomChip.swift
//  introToSwiftUI
//
//  Created by Alessandro Emanuel Ferreira de Souza on 10/12/24.
//

import SwiftUI

struct CustomChip: View {
    
    let supportVisual: String
    let actionIcon: String
    let title: LocalizedStringKey
    @State var isSelected: Bool
    
    var body: some View {
        HStack(spacing: 4) {
            Image.init(systemName: supportVisual).font(.body)//32
            Text(title)
                .font(.body)
                .lineLimit(1)
                .padding(.horizontal, 8)
            Image.init(systemName: actionIcon).font(.body)//32
        }
        .padding(.vertical, 4)
        .padding(.leading, 4)
        .padding(.trailing, 10)
        .frame(height: 40)
        .foregroundColor(isSelected ? .white : .blue)
        .background(isSelected ? Color.blue : Color.white)
        .cornerRadius(999)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.blue, lineWidth: 1.5)
            
        ).onTapGesture {
            isSelected.toggle()
        }
        .frame(minWidth: .zero, maxWidth: 238)
    }
}

struct CustomCustomChip_Preview: PreviewProvider {
    static var previews: some View {
        @State var selectedChip: String?
        
        VStack {
            CustomChip(
                supportVisual: "heart.circle",
                actionIcon: "chevron.right",
                title: "Title",
                isSelected: false)
            .previewLayout(.sizeThatFits)
            .padding()
            
            CustomChip(
                supportVisual: "heart.circle",
                actionIcon: "chevron.right",
                title: "TitleTitleTitleTitleTitleTitleTitleTitleTitle",
                isSelected: false)
            .previewLayout(.sizeThatFits)
            .padding()
        }
    }
}

