//
//  ColorHelper.swift
//  SPM_Foundations
//
//  Created by Danis Preldzic on 7. 4. 2025..
//

import SwiftUI

public enum ColorType {
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
}

public protocol ColorHelper {
    @available(macOS 10.15, *)
    func getColor(_ type: ColorType) -> Color
}
