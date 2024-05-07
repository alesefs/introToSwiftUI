//
//  CustomIcon.swift
//  introToSwiftUI
//
//  Created by Alessandro Emanuel Ferreira de Souza on 07/05/24.
//

import SwiftUI


enum CustomIconStyle {
    case Success(shapeColor: Color = Color.green, iconColor: Color = Color.black, showShape: Bool = true)
    case Warning(shapeColor: Color = Color.yellow, iconColor: Color = Color.orange, showShape: Bool = true)
    case Error(shapeColor: Color = Color.red, iconColor: Color = Color.yellow, showShape: Bool = true)
    case Info(shapeColor: Color = Color.blue, iconColor: Color = Color.white, showShape: Bool = true)
    case Neutral(shapeColor: Color = Color.gray, iconColor: Color = Color.black, showShape: Bool)
    case Custom(shapeColor: Color, iconColor: Color, showShape: Bool)
    
    var shapeColor: Color {
        switch self {
        case .Success(shapeColor: let shapeColor, iconColor: _, showShape: _):
                return shapeColor
        case .Warning(shapeColor: let shapeColor, iconColor: _, showShape: _):
                return shapeColor
        case .Error(shapeColor: let shapeColor, iconColor: _, showShape: _):
                return shapeColor
        case .Info(shapeColor: let shapeColor, iconColor: _, showShape: _):
                return shapeColor
        case .Neutral(shapeColor: let shapeColor, iconColor: _, showShape: _):
                return shapeColor
        case .Custom(shapeColor: let shapeColor, iconColor: _, showShape: _):
                return shapeColor
            }
    }
    
    var iconColor: Color {
        switch self {
        case .Success(shapeColor: _, iconColor: let iconColor, showShape: _):
                return iconColor
        case .Warning(shapeColor: _, iconColor: let iconColor, showShape: _):
                return iconColor
        case .Error(shapeColor: _, iconColor: let iconColor, showShape: _):
                return iconColor
        case .Info(shapeColor: _, iconColor: let iconColor, showShape: _):
                return iconColor
        case .Neutral(shapeColor: _, iconColor: let iconColor, showShape: _):
                return iconColor
        case .Custom(shapeColor: _, iconColor: let iconColor, showShape: _):
                return iconColor
            }
    }
    
    var showShape: Bool {
        switch self {
        case .Success(shapeColor: _, iconColor: _, showShape: let showShape):
                return showShape
        case .Warning(shapeColor: _, iconColor: _, showShape: let showShape):
                return showShape
        case .Error(shapeColor: _, iconColor: _, showShape: let showShape):
                return showShape
        case .Info(shapeColor: _, iconColor: _, showShape: let showShape):
                return showShape
        case .Neutral(shapeColor: _, iconColor: _, showShape: let showShape):
                return showShape
        case .Custom(shapeColor: _, iconColor: _, showShape: let showShape):
                return showShape
            }
    }
}

/*
 var iconColor: Color {
     switch self {
     case .success(_, let color):
       return color
     case .warning(_, let color):
       return color
     case .error(_, let color):
       return color
     case .info(_, let color):
       return color
     case .neutral:
       return .darkGray
     case .custom(_, let color, _):
       return color
     }
   }

   var showShape: Bool {
     switch self {
     case .success, .warning, .error, .info:
       return true
     case .neutral(let show):
       return show
     case .custom(_, _, let show):
       return show
     }
   }
 
 extension CustomIconStyle {
   static let success = CustomIconStyle.success(shapeColor: .lightGreen, iconColor: .darkGreen)
   static let warning = CustomIconStyle.warning(shapeColor: .lightYellow, iconColor: .darkYellow)
   static let error = CustomIconStyle.error(shapeColor: .lightRed, iconColor: .darkRed)
   static let info = CustomIconStyle.info(shapeColor: .lightCyan, iconColor: .darkCyan)
   static func neutral(showShape: Bool = true) -> CustomIconStyle {
     return .neutral(showShape: showShape)
   }
   static func custom(shapeColor: Color, iconColor: Color, showShape: Bool = true) -> CustomIconStyle {
     return .custom(shapeColor: shapeColor, iconColor: iconColor, showShape: showShape)
   }
 }
 */

enum CustomIconSize: CaseIterable, Hashable {
    case Large, Medium, Small
    
    var size: CustomIconSize {
        switch self {
            case .Large: return .Large
            case .Medium: return .Medium
            case .Small: return .Small
        }
    }
    
    var iconSize: CGFloat {
        switch self {
            case .Large: return 24
            case .Medium: return 16
            case .Small: return 16
        }
    }
    
    var shapeSize: CGFloat {
        switch self {
            case .Large: return 48
            case .Medium: return 32
            case .Small: return 24
        }
    }
    
    var padding: CGFloat {
        switch self {
            case .Large: return 12
            case .Medium: return 8
            case .Small: return 4
        }
    }

}

struct CustomIcon: View {
    
    var icon: String
    var style: CustomIconStyle
    var size: CustomIconSize
    
    init(icon: String, style: CustomIconStyle, size: CustomIconSize) {
        self.icon = icon
        self.style = style
        self.size = size
    }
    
    var body: some View {
        Image(systemName: icon)
            .resizable()
            .foregroundColor(style.iconColor)
            .frame(width: size.iconSize, height: size.iconSize)
            .padding(.all, style.showShape ? size.padding : 0)
            .frame(width: size.shapeSize, height: size.shapeSize)
            .background(style.showShape ? style.shapeColor : Color.black.opacity(0.0))
            .cornerRadius(999)
            .aspectRatio(contentMode: .fit)
    }
}

#Preview {
    CustomIcon(
        icon: "binoculars.fill",
        style: .Custom(shapeColor: .purple, iconColor: .red, showShape: false),
        size: .Large
    )
}
