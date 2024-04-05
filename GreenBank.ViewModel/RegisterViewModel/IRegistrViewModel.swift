//
//  IRegistrViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Eprem Sargsyan on 09.02.24.
//

import Foundation

public protocol IRegisterViewModel: IViewModel {
    var validator: Validators { get }
    func postUser(_ userRegisterInformation: UserRegistrationInfo) async throws
}
