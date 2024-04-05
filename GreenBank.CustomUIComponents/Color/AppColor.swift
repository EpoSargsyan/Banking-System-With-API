//
//  AppColor.swift
//  GreenBank.CustomUIComponents
//
//  Created by Anna Hakobyan on 20.03.24.
//

import UIKit

public enum AppColor {
    case primaryDisable
    case primaryFocus
    case primaryDefault
    case primaryHover
    case primaryPressed
    case accentDisable
    case accentFocus
    case accentDefault
    case accentHover
    case accentPressed
    case errorDisable
    case errorFocus
    case errorDefault
    case errorHover
    case errorPressed
    case cremeWhite
    case grey100
    case grey200
    case grey300
    case grey400
    case lightGrey
    case textBlack
    case textDarkGrey
    case textGrey
    case textLightGrey
    case textLightestGrey
    
   public var uiColor: UIColor {
        switch self {
        case .primaryDisable: return UIColor(named: "PrimaryDisable")!
        case .primaryFocus: return UIColor(named: "PrimaryFocus")!
        case .primaryDefault: return UIColor(named: "PrimaryDefault")!
        case .primaryHover: return UIColor(named: "PrimaryHover")!
        case .primaryPressed: return UIColor(named: "PrimaryPressed")!
        case .accentDisable: return UIColor(named: "AccentDisable")!
        case .accentFocus: return UIColor(named: "AccentFocus")!
        case .accentDefault: return UIColor(named: "AccentDefault")!
        case .accentHover: return UIColor(named: "AccentHover")!
        case .accentPressed: return UIColor(named: "AccentPressed")!
        case .errorDisable: return UIColor(named: "ErrorDisable")!
        case .errorFocus: return UIColor(named: "ErrorFocus")!
        case .errorDefault: return UIColor(named: "ErrorDefault")!
        case .errorHover: return UIColor(named: "ErrorHover")!
        case .errorPressed: return UIColor(named: "ErrorPressed")!
        case .cremeWhite: return UIColor(named: "NeutralWhite")!
        case .grey100: return UIColor(named: "NeutralGrey100")!
        case .grey200: return UIColor(named: "NeutralGrey200")!
        case .grey300: return UIColor(named: "NeutralGrey300")!
        case .grey400: return UIColor(named: "NeutralGrey400")!
        case .textBlack: return UIColor(named: "TextBlack")!
        case .textDarkGrey: return UIColor(named: "TextDarkGrey")!
        case .textGrey: return UIColor(named: "TextGrey")!
        case .textLightGrey: return UIColor(named: "TextLightGrey")!
        case .textLightestGrey: return UIColor(named: "TextLightestGrey")!
        case .lightGrey: return UIColor(named: "LightGrey")!
        }
    }
}
