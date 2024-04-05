//
//  NewAccountViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Eprem Sargsyan on 28.02.24.
//

import Foundation
import GreenBank_Networking

public class NewAccountViewModel: INewAccountViewModel {
    public var validator: Validators
    public var status: String = ""
    public var accountInfo: NewAccountInformation?
    
    public init() {
        self.validator = Validators.shared
    }
    
    public func postNewAccount(_ newAccountInfo: NewAccountInfo, accessToken: String?) async throws {
        let urlSessionConfiguration = URLSessionConfiguration(url: "https://greenbank1.coderepublic.am/api/account",
                                                              accessToken: accessToken,
                                                              body: newAccountInfo,
                                                              method: .post)
        
        let newAccInf: NewAccountGetInfo
        
        do {
            newAccInf = try await URLSession.shared.execute(with: urlSessionConfiguration,
                                                            dataType: NewAccountGetInfo.self)!
            
            accountInfo = newAccInf.value
            status = newAccInf.status

        } catch {
            print(error.localizedDescription)
        }
    }
}
