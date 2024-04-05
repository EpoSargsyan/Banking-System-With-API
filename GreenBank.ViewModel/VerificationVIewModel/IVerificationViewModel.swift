//
//  IVerificationViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Eprem Sargsyan on 09.02.24.
//

import Foundation

protocol IVerificationViewModel: IViewModel {
    func sendUserNumber(verificationCode: String) async throws
    func sendForgotPasswordCode(verificationCode: String) async throws
}
