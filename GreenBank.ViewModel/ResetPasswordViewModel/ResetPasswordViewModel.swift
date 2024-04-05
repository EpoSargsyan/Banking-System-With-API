//
//  ResetPasswordViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Eprem Sargsyan on 09.02.24.
//

import Foundation
import GreenBank_Networking

public class ResetPasswordViewModel: IResetPasswordViewModel {
    public var validator: Validators
    
    public init() {
        self.validator = Validators.shared
    }
    
    public func resetPassword(password: String) async throws {
        let userId = UserDefaults.standard.string(forKey: "userId") ?? ""
    
        let changePassword = ResetPasswordInfo(password: password, userId: userId)
        
        let urlSessionConfiguration = URLSessionConfiguration(url: "http://localhost:3001/api/auth/reset-password",
                                                              body: changePassword,
                                                              method: .patch)
        
        do {
            try await URLSession.shared.execute(with: urlSessionConfiguration,
                                                dataType: ResetGetInfo.self)
        } catch {
            print(error.localizedDescription)
            throw HTTPNetworkError.UnwrappingError
        }
    }
}
