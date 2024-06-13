//
//  Screen1.swift
//  introToSwiftUI
//
//  Created by Alessandro Emanuel Ferreira de Souza on 12/06/24.
//

import SwiftUI

struct Screen1: View {
    
    var brand: String
    
    init(brand: String) {
        self.brand = brand
    }
    
    var body: some View {
        NavigationView {
            NavigationLink {
                CustomNavigationSimpleStack()
            } label: {
                Text("screen 1 \(brand)")
            }
            
        }
    }
}

#Preview {
    Screen1(brand: "ferrari")
}
