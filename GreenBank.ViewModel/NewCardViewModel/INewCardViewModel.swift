//
//  INewCardViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Anna Hakobyan on 14.03.24.
//

import Foundation

public protocol INewCardViewModel: IViewModel {
    var validator: Validators { get }
    func postNewCard(_ newCardInfo: NewCardInfo, accessToken: String?) async throws
}
