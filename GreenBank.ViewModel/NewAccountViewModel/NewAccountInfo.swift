//
//  NewAccountInfo.swift
//  GreenBank.ViewModel
//
//  Created by Eprem Sargsyan on 28.02.24.
//

import Foundation

public struct NewAccountInfo: Codable {
    public var accountName: String?
    public var currency: String?
    public var accountType: String?
    public var userId: String?
    
    public init() {}
}
