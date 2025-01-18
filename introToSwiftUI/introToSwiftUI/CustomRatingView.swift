//
//  CustomRatingView.swift
//  introToSwiftUI
//
//  Created by Alessandro Emanuel Ferreira de Souza on 18/01/25.
//

import SwiftUI

struct RatingModel {
    var rating: Int = 0
}

class RatingViewModel: ObservableObject {
    @Published var ratingModel = RatingModel()
    
    func updateRating(_ value: Int) {
        ratingModel.rating = value
    }
    
    func clearRating() {
        ratingModel.rating = 0
    }
}

struct RatingButton: View {
    @ObservedObject var viewModel: RatingViewModel = RatingViewModel()
    let index: Int
    var iconActive: String
    var iconInactive: String
    var strokeIconColor: Color
    var changeRating: ((Int) -> Void)? = nil
    
    var body: some View {
        Image(systemName: viewModel.ratingModel.rating >= index ? iconActive : iconInactive)
        //            .resizable()
        //            .frame(width: 24.0, height: 24.0)
        //            .frame(maxWidth: 40.0, maxHeight: 40.0)
            .foregroundColor(strokeIconColor)
            .onTapGesture {
                if index == viewModel.ratingModel.rating {
                    viewModel.clearRating()
                    if let changeRating {
                        changeRating(0)
                    }
                } else {
                    viewModel.updateRating(index)
                    if let changeRating {
                        changeRating(index)
                    }
                }
            }
    }
}

struct RatingGroup: View {
    @ObservedObject private var viewModel: RatingViewModel = RatingViewModel()
    var minText: String? = nil
    var maxText: String? = nil
    var iconActive: String = "star.fill"
    var iconInactive: String = "star"
    var strokeIconColor: Color = .orange
    var changeRating: ((Int) -> Void)? = nil
    
    private let maxIndex = 5
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Spacer().frame(width: 16.0, height: 10.0).background(Color.red)
                ForEach(1...maxIndex, id: \.self) { index in
                    RatingButton(
                        viewModel: viewModel,
                        index: index,
                        iconActive: iconActive,
                        iconInactive: iconInactive,
                        strokeIconColor: strokeIconColor,
                        changeRating: changeRating
                    )
                    if(index < maxIndex) {
                        Spacer().frame(width: 16.0, height: 10.0).background(Color.red)
                    }
                    
                }
                Spacer().frame(width: 16.0, height: 10.0).background(Color.red)
            }
            
            if (minText != nil && maxText != nil) {
                HStack {
                    if let minText {
                        Text(minText)
                    }
                    Spacer()
                    if let maxText {
                        Text(maxText)
                    }
                }
                .padding(.top, 8.0)
            }
        }
    }
}
#Preview {
    VStack (alignment: .center) {
        RatingGroup()
        
        Divider()
        
        RatingGroup(
            minText: "min",
            maxText: "max",
            iconActive: "heart.fill",
            iconInactive: "heart",
            strokeIconColor: .red
        ){ rating in print("Rating: \(rating)") }
    }
}
