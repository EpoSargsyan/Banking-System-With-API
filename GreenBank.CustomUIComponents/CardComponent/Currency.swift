//
//  Currency.swift
//  GreenBank.CustomUIComponents
//
//  Created by Anna Hakobyan on 01.03.24.
//
import Foundation

public enum Currency: String {
    case usd = "USD"
    case amd = "AMD"
    case eur = "EUR"
    case rub = "RUB"
    
    public var symbol: String {
        switch self {
        case .usd: return "$"
        case .amd: return "֏"
        case .eur: return "€"
        case .rub: return "₽"
        }
    }
}
