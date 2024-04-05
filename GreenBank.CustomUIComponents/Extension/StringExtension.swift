//
//  StringExtension.swift
//  GreenBank.Localization
//
//  Created by Anna Hakobyan on 18.01.24.
//

import Foundation

public extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
