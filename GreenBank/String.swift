//
//  String.swift
//  GreenBank
//
//  Created by Anna Hakobyan on 18.01.24.
//

import Foundation

//for localization
extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
