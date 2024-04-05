//
//  VerificationViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Eprem Sargsyan on 09.02.24.
//

import Foundation
import GreenBank_Networking

public struct VerificationViewModel: IVerificationViewModel {
    public init() {}
    
    public func sendUserNumber(verificationCode: String) async throws {
        let userId = UserDefaults.standard.string(forKey: "userId")
        
        let userVerification = UserVerification(userId: userId ?? "", verificationCode: verificationCode)
        
        let urlSessionConfiguration = URLSessionConfiguration(url: "https://greenbank1.coderepublic.am/api/auth/activate",
                                                       body: userVerification,
                                                       method: .patch)
        
        do {
            try await URLSession.shared.execute(with: urlSessionConfiguration,
                                                       dataType: UserVerification.self)
        } catch {
            print(error.localizedDescription)
            throw HTTPNetworkError.UnwrappingError
        }
        
    }
    
    public func sendForgotPasswordCode(verificationCode: String) async throws {
        let userId = UserDefaults.standard.string(forKey: "userId") ?? ""
        
        let userVerification = UserVerification(userId: userId, verificationCode: verificationCode)
        
        let urlSessionConfiguration = URLSessionConfiguration(url: "http://localhost:3001/api/auth/forgot-password",
                                                       body: userVerification,
                                                       method: .post)
        
        do {
            try await URLSession.shared.execute(with: urlSessionConfiguration,
                                                       dataType: ForgotPasswordInfo.self)
        } catch {
            print(error.localizedDescription)
            throw HTTPNetworkError.UnwrappingError
        }
    }
}
