//
//  LoginViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Hovo Ohanyan on 15.01.24.
//

import Foundation
import GreenBank_Networking

public class LoginViewModel: ILoginViewModel {
    public var validator: IValidators
    
    public init() {
        validator = Validators.shared
    }
    
    public func getUser(withEmail email: String, withPassword password: String) async throws -> ServerResponse? {
        let user = UserLogin(email: email, password: password)
        
        let urlSessionConfiguration = URLSessionConfiguration(url: "https://greenbank1.coderepublic.am/api/auth/login",
                                                              body: user,
                                                              method: .post)
        
        do {
            return try await URLSession.shared.execute(with: urlSessionConfiguration,
                                                       dataType: ServerResponse.self)
        } catch {
            print(error.localizedDescription)
            throw HTTPNetworkError.UnwrappingError
        }
    }
}
