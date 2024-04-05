//
//  HomePageVIewModel.swift
//  GreenBank.ViewModel
//
//  Created by Anna Hakobyan on 15.03.24.
//

import Foundation
import GreenBank_Networking

public class HomePageVIewModel: IHomePageViewModel {
    public var validator: Validators
    
    public init() {
        self.validator = Validators.shared
    }
    
    public func getAllCards(userId: String, accessToken: String?) async throws -> GetCards? {
        let configuration = URLSessionConfiguration(url: "https://greenbank1.coderepublic.am/api/card?userId=\(userId)",
                                                    accessToken: accessToken,
                                                    method: .get)
        do {
            return try await URLSession.shared.execute(with: configuration, dataType: GetCards.self)
        } catch {
            print(error.localizedDescription)
            throw HTTPNetworkError.UnwrappingError
        }
    }
    
    public func getAllAccountns(userId: String, accessToken: String?) async throws -> GetAccounts? {
        let urlSessionConfiguration = URLSessionConfiguration(url: "http://localhost:3001/api/account?userId=\(userId)",
                                                              accessToken: accessToken,
                                                              method: .get)

        do {
            return try await URLSession.shared.execute(with: urlSessionConfiguration,
                                                       dataType: GetAccounts.self)
        } catch {
            print(error.localizedDescription)
            throw HTTPNetworkError.UnwrappingError
        }
    }
}
