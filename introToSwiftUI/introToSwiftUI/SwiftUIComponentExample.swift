//
//  SwiftUIComponentExample.swift
//  introToSwiftUI
//
//  Created by Alessandro Emanuel Ferreira de Souza on 10/03/24.
//

import SwiftUI
import Foundation

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
    @ObservedObject var viewModel: RatingViewModel
    let index: Int
    var changeRating: (Int) -> Void
    
    var body: some View {
        Image(systemName: viewModel.ratingModel.rating >= index ? "star.fill" : "star")
            .foregroundColor(.yellow)
            .onTapGesture {
                if (index == viewModel.ratingModel.rating) {
                    viewModel.clearRating()
                    changeRating(0)
                } else {
                    viewModel.updateRating(index)
                    changeRating(index)
                }
            }
    }
}

struct RatingGroup: View {
    @ObservedObject var viewModel: RatingViewModel
    var changeRating: (Int) -> Void
    
    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { index in
                RatingButton(viewModel: viewModel, index: index, changeRating: changeRating)
            }
        }
        .foregroundColor(.orange)
    }
}

struct SwiftUIComponentExample: View {
    @ObservedObject var viewModel = RatingViewModel()
    @State var showText: Bool = true
    
    var body: some View {
        
        ZStack {
            //            Color(.systemMint)
            //                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20.0) {
                Image("toronto")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
                
                HStack {
                    Text("Toronto")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    VStack {
                        /*
                         HStack {
                         /*
                          Image(systemName: "star.fill")
                          Image(systemName: "star.fill")
                          Image(systemName: "star.fill")
                          Image(systemName: "star.leadinghalf.filled")
                          Image(systemName: "star")
                          */
                         ForEach(1...5, id: \.self) { index in
                         RatingButton(viewModel: viewModel, index: index)
                         }
                         }
                         .foregroundColor(.orange)
                         */
                        
                        RatingGroup(viewModel: viewModel) { rating in
                            print("click \(rating)")
                            showText = rating > 0
                        }
                        
                        if showText {
                            Text("Asiatech \(viewModel.ratingModel.rating)")
                        }
                        
                        Text("(Reviews 361)")
                    }
                    .font(.caption)
                    
                }
                
                Text("come visit Toronto for an experience of a lifetime")
                
                HStack {
                    Spacer()
                    Image(systemName: "fork.knife")
                    Image(systemName: "binoculars.fill")
                }
                .foregroundColor(.gray)
                .font(.caption)
            }
            .padding()
            .background(
                Rectangle()
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                        //                            .inset(by: 4.0)
                            .stroke(.blue, lineWidth: 2.0)
                    )
                    .shadow(radius: 15)
            )
            .padding()
        }
    }
}

#Preview {
    SwiftUIComponentExample()
}
