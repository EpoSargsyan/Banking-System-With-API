//
//  PassAccountInfoDelegate.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 29.03.24.
//

import UIKit

public protocol PassAccountInfoDelegate: AnyObject {
    func passInfoFromFunction(accountInfo: String)
}
