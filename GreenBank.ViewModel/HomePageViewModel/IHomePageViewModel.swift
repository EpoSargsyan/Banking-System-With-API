//
//  IHomePageViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Anna Hakobyan on 15.03.24.
//

import Foundation

public protocol IHomePageViewModel: IViewModel {
    var validator: Validators { get }
    func getAllCards(userId: String, accessToken: String?) async throws -> GetCards?
    func getAllAccountns(userId: String, accessToken: String?) async throws -> GetAccounts?
}
