//
//  CompareEnums.swift
//  introToSwiftUI
//
//  Created by Alessandro Emanuel Ferreira de Souza on 18/07/24.
//

import Foundation

enum Icons: String, CaseIterable {
    case london = "london"
    case toronto = "toronto"
    case saoPaulo = "ic_sao_paulo"
}

struct IconAzure {
    private let icons: [(String, String)] = [
        ("ic_london", Icons.london.rawValue),
        ("ic_toronto", "toronto"),
        ("ic_sao_paulo", "ic_sao_paulo")
    ]
    
    
    
    func iconOkName(iconName: String) -> String {
        let firstIconMatching = icons.first(where: { $0.1 == iconName })
        let zeroIconMatching = icons.first(where: { $0.0 == iconName })

        return if let icon = zeroIconMatching {
            icon.1
        } else if let icon = firstIconMatching {
            icon.1
        } else {
            "error"
        }
    }
}
