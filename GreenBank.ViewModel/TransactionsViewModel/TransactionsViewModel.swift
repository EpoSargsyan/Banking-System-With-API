//
//  AccountTransferViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Eprem Sargsyan on 28.03.24.
//

import Foundation
import GreenBank_Networking

public class TransactionsViewModel: ITransactionsViewModel {
    public var validator: Validators
    
    public init() {
        self.validator = Validators.shared
    }
    
    public func transfer(accountTransferInfo: TransactionInfo?, accessToken: String) async throws {
        
        let urlSessionConfig = URLSessionConfiguration(url: "http://localhost:3001/api/transactions",
                                                       accessToken: accessToken,
                                                       body: accountTransferInfo,
                                                       method: .post)
        
        do {
            try await URLSession.shared.execute(with: urlSessionConfig,
                                                dataType: TransactionGetInfo.self)
            
        } catch {
            print(error.localizedDescription)
            throw HTTPNetworkError.UnwrappingError
        }
    }
}
