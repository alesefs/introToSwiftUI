//
//  CustomIcon.swift
//  introToSwiftUI
//
//  Created by Alessandro Emanuel Ferreira de Souza on 07/05/24.
//

import SwiftUI


enum CustomIconStyle: Hashable {
    case Success, Warning, Error, Info
    case Neutral(showShape: Bool)
    case Custom(shapeColor: Color, iconColor: Color, showShape: Bool)
    
    var shapeColor: Color {
        switch self {
            case .Success:
                return Color.green
            case .Warning:
                return Color.yellow
            case .Error:
                return Color.red
            case .Info:
                return Color.blue
            case .Neutral:
                return Color.gray
            case .Custom(shapeColor: let shapeColor, iconColor: _, showShape: _):
                return shapeColor
        }
    }
    
    var iconColor: Color {
        switch self {
            case .Success:
                return Color.black
            case .Warning:
                return Color.orange
            case .Error:
                return Color.yellow
            case .Info:
                return Color.white
            case .Neutral:
                return Color.black
            case .Custom(shapeColor: _, iconColor: let iconColor, showShape: _):
                return iconColor
        }
    }
    
    var showShaped: Bool {
        switch self {
            case .Success:
                return true
            case .Warning:
                return true
            case .Error:
                return true
            case .Info:
                return true
            case .Neutral(showShape: let showShape):
                return showShape
            case .Custom(shapeColor: _, iconColor: _, showShape: let showShape):
                return showShape
        }
    }
    
    static var allCases: [CustomIconStyle] {
        return [
            .Success, .Warning, .Error, .Info,
            .Neutral(showShape: true),
            .Neutral(showShape: false),
            .Custom(shapeColor: .pink, iconColor: .black, showShape: true),
            .Custom(shapeColor: .pink, iconColor: .pink, showShape: false),
        ]
    }
    
    /*case Success(shapeColor: Color = Color.green, iconColor: Color = Color.black, showShape: Bool = true)
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
    }*/
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

struct CustomIcon: View, Hashable {
    
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
            .frame(width: size.iconSize, height: size.iconSize)
            .foregroundColor(style.iconColor)
            .padding(.all, style.showShaped ? size.padding : 0)
            .frame(
                width: style.showShaped ? size.shapeSize : (size.shapeSize - size.padding),
                height: style.showShaped ? size.shapeSize : (size.shapeSize - size.padding)
            )
            .background(style.showShaped ? style.shapeColor : .black.opacity(0.1))
            .cornerRadius(999)
            .aspectRatio(contentMode: .fit)
    }
}


#Preview {
    CustomIcon(
        icon: "binoculars.fill",
        style: .Error,
        size: .Large
    )
    
//    VStack {
//        ForEach(CustomIconSize.allCases, id: \.self) { size in
//            VStack {
//                Text(size.rawValue)
//                HStack {
//                    ForEach(CustomIconStyle.allCases, id: \.self) { style in
//                        CustomIcon(icon: "binoculars.fill", style: style, size: size)
//                    }
//                }
//            }
//        }
//    }
}

struct CustomIcon_Previews: PreviewProvider {
    static var previews: some View {
        var arrayLarge = [
            CustomIcon(
                icon: "binoculars.fill",
                style: .Success,
                size: .Large
            ),
            CustomIcon(
                icon: "binoculars.fill",
                style: .Warning,
                size: .Large
            ),
            CustomIcon(
                icon: "binoculars.fill",
                style: .Error,
                size: .Large
            ),
            CustomIcon(
                icon: "binoculars.fill",
                style: .Info,
                size: .Large
            ),
            CustomIcon(
                icon: "binoculars.fill",
                style: .Neutral(showShape: true),
                size: .Large
            ),
            CustomIcon(
                icon: "binoculars.fill",
                style: .Neutral(showShape: false),
                size: .Large
            ),
            CustomIcon(
                icon: "binoculars.fill",
                style: .Custom(shapeColor: .black, iconColor: .pink, showShape: true),
                size: .Large
            ),
            CustomIcon(
                icon: "binoculars.fill",
                style: .Custom(shapeColor: .pink, iconColor: .pink, showShape: false),
                size: .Large
            )
        ]
        
        var arrayMedium = [
            CustomIcon(
                icon: "binoculars.fill",
                style: .Success,
                size: .Medium
            ),
            CustomIcon(
                icon: "binoculars.fill",
                style: .Warning,
                size: .Medium
            ),
            CustomIcon(
                icon: "binoculars.fill",
                style: .Error,
                size: .Medium
            ),
            CustomIcon(
                icon: "binoculars.fill",
                style: .Info,
                size: .Medium
            ),
            CustomIcon(
                icon: "binoculars.fill",
                style: .Neutral(showShape: true),
                size: .Medium
            ),
            CustomIcon(
                icon: "binoculars.fill",
                style: .Neutral(showShape: false),
                size: .Medium
            ),
            CustomIcon(
                icon: "binoculars.fill",
                style: .Custom(shapeColor: .black, iconColor: .pink, showShape: true),
                size: .Medium
            ),
            CustomIcon(
                icon: "binoculars.fill",
                style: .Custom(shapeColor: .pink, iconColor: .pink, showShape: false),
                size: .Medium
            )
        ]
        
        var arraySmall = [
            CustomIcon(
                icon: "binoculars.fill",
                style: .Success,
                size: .Small
            ),
            CustomIcon(
                icon: "binoculars.fill",
                style: .Warning,
                size: .Small
            ),
            CustomIcon(
                icon: "binoculars.fill",
                style: .Error,
                size: .Small
            ),
            CustomIcon(
                icon: "binoculars.fill",
                style: .Info,
                size: .Small
            ),
            CustomIcon(
                icon: "binoculars.fill",
                style: .Neutral(showShape: true),
                size: .Small
            ),
            CustomIcon(
                icon: "binoculars.fill",
                style: .Neutral(showShape: false),
                size: .Small
            ),
            CustomIcon(
                icon: "binoculars.fill",
                style: .Custom(shapeColor: .black, iconColor: .pink, showShape: true),
                size: .Small
            ),
            CustomIcon(
                icon: "binoculars.fill",
                style: .Custom(shapeColor: .pink, iconColor: .pink, showShape: false),
                size: .Small
            )
        ]
        
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(arrayLarge, id: \.self) { list in
                        CustomIcon(
                            icon: list.icon,
                            style: list.style,
                            size: list.size
                        )
                    }
                }
            }
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(arrayMedium, id: \.self) { list in
                        CustomIcon(
                            icon: list.icon,
                            style: list.style,
                            size: list.size
                        )
                    }
                }
            }
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(arraySmall, id: \.self) { list in
                        CustomIcon(
                            icon: list.icon,
                            style: list.style,
                            size: list.size
                        )
                    }
                }
            }
            
            ScrollView(.vertical) {
                VStack {
                    ForEach(CustomIconSize.allCases, id: \.self) { size in
                        VStack {
                            HStack {
                                ForEach(CustomIconStyle.allCases, id: \.self) { style in
                                    CustomIcon(icon: "binoculars.fill", style: style, size: size)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
