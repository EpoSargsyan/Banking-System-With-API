//
//  INewAccountViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Eprem Sargsyan on 28.02.24.
//

import Foundation

public protocol INewAccountViewModel: IViewModel {
    var validator: Validators { get }
    func postNewAccount(_ newAccountInfo: NewAccountInfo, accessToken: String?) async throws
}
