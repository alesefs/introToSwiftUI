//
//  CustomChipView.swift
//  introToSwiftUI
//
//  Created by Alessandro Emanuel Ferreira de Souza on 03/01/25.
//

import Foundation
import SwiftUI

struct ChipModel: Identifiable {
    @State var isSelected: Bool
    let id = UUID()
    let systemImage: String
    let titleKey: LocalizedStringKey
}

class ChipsViewModel: ObservableObject {
//    @Published var dataObject: [ChipModel] = [ChipModel.init(isSelected: false, systemImage: "pencil.circle", titleKey: "Pencil Circle")]
    @Published var chipArray: [ChipModel] = [
        ChipModel(isSelected: false, systemImage: "heart.circle", titleKey: "Heart"),
        ChipModel(isSelected: false, systemImage: "folder.circle", titleKey: "Folder"),
        ChipModel(isSelected: false, systemImage: "pencil.and.outline", titleKey: "Pen"),
        ChipModel(isSelected: false, systemImage: "book.circle", titleKey: "Book"),
        ChipModel(isSelected: false, systemImage: "paperplane.circle", titleKey: "Paper Plain"),
        ChipModel(isSelected: false, systemImage: "opticaldiscdrive", titleKey: "Optical Drive"),
        ChipModel(isSelected: false, systemImage: "doc.circle", titleKey: "Documents")
    ]
    
//    func addChip() {
//        dataObject.append(ChipModel.init(isSelected: false, systemImage: "pencil.circle", titleKey: "Pencil"))
//    }
//
//    func removeLast() {
//        guard dataObject.count != 0 else {
//            return
//        }
//        dataObject.removeLast()
//    }
}

//chipUnico
struct ChipView: View {
    let systemImage: String
    let titleKey: LocalizedStringKey
    @State var isSelected: Bool
    
    var body: some View {
        HStack(spacing: 4) {
            Image.init(systemName: systemImage).font(.body)
            Text(titleKey).font(.body).lineLimit(1)
        }
        .padding(.vertical, 4)
        .padding(.leading, 4)
        .padding(.trailing, 10)
        .foregroundColor(isSelected ? .white : .blue)
        .background(isSelected ? Color.blue : Color.white)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.blue, lineWidth: 1.5)
            
        ).onTapGesture {
            isSelected.toggle()
        }
    }
}



struct ChipView_Previews: PreviewProvider {
    static var previews: some View {
        ChipView(systemImage: "heart.circle", titleKey: "Title", isSelected: false)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

//ChipGrid
struct ChipContainerView: View {
    @ObservedObject var viewModel = ChipsViewModel()
    
    var body: some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
//        ScrollView (.vertical, showsIndicators: false) {
//            GeometryReader { geo in
                ZStack(alignment: .topLeading, content:{
                    ForEach(viewModel.chipArray) { data in
                        ChipView(systemImage: data.systemImage,
                                 titleKey: data.titleKey,
                                 isSelected: data.isSelected)
                        .padding(.all, 5)
                        .alignmentGuide(.leading) { dimension in
                            if (abs(width - dimension.width) > UIScreen.main.bounds.width) {
                                width = 0
                                height -= dimension.height
                            }
                            let result = width
                            if data.id == viewModel.chipArray.last!.id {
                                width = 0
                            } else {
                                width -= dimension.width
                            }
                            return result
                        }
                        .alignmentGuide(.top) { dimension in
                            let result = height
                            if data.id == viewModel.chipArray.last!.id {
                                height = 0
                            }
                            return result
                        }
                    }
                })
//            }
//        }
    }
}

struct ChipContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ChipContainerView()
    }
}


//ShowCase
struct CustomChipView: View {
    @StateObject var viewModel = ChipsViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Select Your Chips")
                .font(.title)
                .fontWeight(.bold)
            ChipContainerView(viewModel: viewModel)
            Text("weqwedsffs")
            ChipContainerView(viewModel: viewModel)
            Text("weqwedsffs")
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}


struct CustomChipView_Previews: PreviewProvider {
    static var previews: some View {
        CustomChipView()
    }
}
