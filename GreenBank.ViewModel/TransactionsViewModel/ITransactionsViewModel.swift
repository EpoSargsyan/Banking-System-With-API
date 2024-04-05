//
//  IAccountTransferViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Eprem Sargsyan on 28.03.24.
//

import Foundation

public protocol ITransactionsViewModel: IViewModel {
    var validator: Validators { get }
    func transfer(accountTransferInfo: TransactionInfo?, accessToken: String) async throws
}
