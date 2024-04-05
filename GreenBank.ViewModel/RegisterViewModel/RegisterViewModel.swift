//
//  RegisterViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Eprem Sargsyan on 09.02.24.
//

import Foundation
import GreenBank_Networking

public class RegisterViewModel: IRegisterViewModel {
    public var validator: Validators
    
    public init() {
        self.validator = Validators.shared
    }
    
    public func postUser(_ userRegisterInformation: UserRegistrationInfo) async throws {
        let urlSessionConfiguration = URLSessionConfiguration(url: "https://greenbank1.coderepublic.am/api/auth/registration",
                                                              body: userRegisterInformation,
                                                              method: .post)
        
        let userRegInfo: UserRegistationGetInfo
        
        do {
            userRegInfo = try await URLSession.shared.execute(with: urlSessionConfiguration,
                                                              dataType: UserRegistationGetInfo.self)!
            
            UserDefaults.standard.setValue(userRegInfo.value?.id, forKey: "userId")
        } catch {
            
        }
    }
}
