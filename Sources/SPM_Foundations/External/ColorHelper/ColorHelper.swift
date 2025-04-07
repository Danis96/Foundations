//
//  ColorHelper.swift
//  SPM_Foundations
//
//  Created by Danis Preldzic on 7. 4. 2025..
//

import SwiftUI

enum ColorHelper {
    case white
    case black
    case grey100
    case grey150
    case grey200
    case grey300
    case grey400
    case grey500
    case grey600
    case grey700
    case grey800
    case grey900
    case blue100
    case blue300
    case blue500
    case blue700
    case blue900
    case lightBlue100
    case lightBlue300
    case lightBlue500
    case lightBlue700
    case lightBlue900
    case purple100
    case purple300
    case purple500
    case purple700
    case purple900
    case magenta100
    case magenta300
    case magenta500
    case magenta700
    case magenta900
    case yellow100
    case yellow300
    case yellow500
    case yellow700
    case yellow900
    case orange100
    case orange300
    case orange500
    case orange700
    case orange900
    case green100
    case green300
    case green500
    case green700
    case green900
    case lightGreen100
    case lightGreen300
    case lightGreen500
    case lightGreen700
    case lightGreen900
    case red100
    case red300
    case red500
    case red700
    case red900
    case darkThemeBackground
    case lightThemeBackground
    case yellow
    case backgroundColor
    case dividerColor
    case primaryColor
    case textColor
    case secondaryTextColor
    
    @available(macOS 10.15, *)
    var color: Color {
        switch self {
            case .white:
                return Color(red: 255/255, green: 255/255, blue: 255/255)
            case .black:
                return Color(red: 0/255, green: 0/255, blue: 0/255)
            case .grey100:
                return Color(red: 247/255, green: 250/255, blue: 252/255)
            case .grey150:
                return Color(red: 236/255, green: 239/255, blue: 242/255)
            case .grey200:
                return Color(red: 217/255, green: 223/255, blue: 230/255)
            case .grey300:
                return Color(red: 198/255, green: 206/255, blue: 217/255)
            case .grey400:
                return Color(red: 179/255, green: 190/255, blue: 205/255)
            case .grey500:
                return Color(red: 160/255, green: 174/255, blue: 192/255)
            case .grey600:
                return Color(red: 128/255, green: 139/255, blue: 154/255)
            case .grey700:
                return Color(red: 96/255, green: 104/255, blue: 115/255)
            case .grey800:
                return Color(red: 57/255, green: 67/255, blue: 79/255)
            case .grey900:
                return Color(red: 32/255, green: 35/255, blue: 38/255)
            case .blue100:
                return Color(red: 209/255, green: 230/255, blue: 255/255)
            case .blue300:
                return Color(red: 116/255, green: 180/255, blue: 255/255)
            case .blue500:
                return Color(red: 27/255, green: 133/255, blue: 243/255)
            case .blue700:
                return Color(red: 18/255, green: 104/255, blue: 204/255)
            case .blue900:
                return Color(red: 12/255, green: 65/255, blue: 128/255)
            case .lightBlue100:
                return Color(red: 220/255, green: 240/255, blue: 255/255)
            case .lightBlue300:
                return Color(red: 150/255, green: 211/255, blue: 255/255)
            case .lightBlue500:
                return Color(red: 80/255, green: 181/255, blue: 255/255)
            case .lightBlue700:
                return Color(red: 64/255, green: 145/255, blue: 204/255)
            case .lightBlue900:
                return Color(red: 40/255, green: 91/255, blue: 128/255)
            case .purple100:
                return Color(red: 242/255, green: 229/255, blue: 255/255)
            case .purple300:
                return Color(red: 214/255, green: 188/255, blue: 250/255)
            case .purple500:
                return Color(red: 164/255, green: 97/255, blue: 216/255)
            case .purple700:
                return Color(red: 115/255, green: 68/255, blue: 151/255)
            case .purple900:
                return Color(red: 66/255, green: 39/255, blue: 86/255)
            case .magenta100:
                return Color(red: 255/255, green: 225/255, blue: 242/255)
            case .magenta300:
                return Color(red: 255/255, green: 194/255, blue: 230/255)
            case .magenta500:
                return Color(red: 255/255, green: 154/255, blue: 213/255)
            case .magenta700:
                return Color(red: 204/255, green: 123/255, blue: 170/255)
            case .magenta900:
                return Color(red: 128/255, green: 77/255, blue: 107/255)
            case .yellow100:
                return Color(red: 255/255, green: 238/255, blue: 198/255)
            case .yellow300:
                return Color(red: 255/255, green: 214/255, blue: 123/255)
            case .yellow500:
                return Color(red: 255/255, green: 197/255, blue: 66/255)
            case .yellow700:
                return Color(red: 230/255, green: 177/255, blue: 59/255)
            case .yellow900:
                return Color(red: 153/255, green: 118/255, blue: 40/255)
            case .orange100:
                return Color(red: 255/255, green: 234/255, blue: 219/255)
            case .orange300:
                return Color(red: 255/255, green: 193/255, blue: 146/255)
            case .orange500:
                return Color(red: 255/255, green: 151/255, blue: 74/255)
            case .orange700:
                return Color(red: 230/255, green: 136/255, blue: 67/255)
            case .orange900:
                return Color(red: 179/255, green: 106/255, blue: 52/255)
            case .green100:
                return Color(red: 216/255, green: 247/255, blue: 234/255)
            case .green300:
                return Color(red: 158/255, green: 234/255, blue: 204/255)
            case .green500:
                return Color(red: 61/255, green: 151/255, blue: 74/255)
            case .green700:
                return Color(red: 49/255, green: 170/255, blue: 122/255)
            case .green900:
                return Color(red: 18/255, green: 64/255, blue: 46/255)
            case .lightGreen100:
                return Color(red: 230/255, green: 243/255, blue: 216/255)
            case .lightGreen300:
                return Color(red: 180/255, green: 220/255, blue: 138/255)
            case .lightGreen500:
                return Color(red: 130/255, green: 196/255, blue: 60/255)
            case .lightGreen700:
                return Color(red: 91/255, green: 137/255, blue: 42/255)
            case .lightGreen900:
                return Color(red: 65/255, green: 98/255, blue: 30/255)
            case .red100:
                return Color(red: 254/255, green: 222/255, blue: 222/255)
            case .red300:
                return Color(red: 253/255, green: 140/255, blue: 140/255)
            case .red500:
                return Color(red: 252/255, green: 90/255, blue: 90/255)
            case .red700:
                return Color(red: 227/255, green: 81/255, blue: 81/255)
            case .red900:
                return Color(red: 151/255, green: 54/255, blue: 54/255)
            case .yellow:
                return Color(red: 245/255, green: 186/255, blue: 65/255)
            case .darkThemeBackground:
                return Color(red: 42, green: 50, blue: 64)
            case .lightThemeBackground:
                return Color(red: 250/255, green: 250/255, blue: 250/255)
        }
    }
}

// Extension for easy access
@available(macOS 10.15, *)
extension Color {
    static func app(_ color: ColorHelper) -> Color {
        return color.color
    }
}

