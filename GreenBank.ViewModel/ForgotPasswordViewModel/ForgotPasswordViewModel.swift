//
//  ForgotPasswordViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Eprem Sargsyan on 09.02.24.
//

import Foundation
import GreenBank_Networking

public class ForgotPasswordViewModel: IForgotPasswordViewModel {
    public var validator: Validators
    
    public init() {
        validator = Validators.shared
    }
    
    public func sendingEmail(_ email: String) async throws {
        let userEmail = UserEmailInfo(email: email)
        
        let urlSessionConfiguration = URLSessionConfiguration(url: "http://localhost:3001/api/auth/forgot-password",
                                                              body: userEmail,
                                                              method: .patch)

        do {
            try await URLSession.shared.execute(with: urlSessionConfiguration,
                                                       dataType: ForgotPasswordInfo.self)
        } catch {
            print(error.localizedDescription)
            throw HTTPNetworkError.UnwrappingError
        }
    }
}
