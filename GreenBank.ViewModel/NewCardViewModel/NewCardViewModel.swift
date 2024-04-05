//
//  NewCardViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Anna Hakobyan on 14.03.24.
//

import Foundation
import GreenBank_Networking

public class NewCardViewModel: INewCardViewModel {
    public var validator: Validators
    public var status: String = ""
    public var cardInfo: CardDetails?
    
    public init() {
        self.validator = Validators.shared
    }
    
    public func postNewCard(_ newCardInfo: NewCardInfo, accessToken: String?) async throws {
        let configuration = URLSessionConfiguration(url: "http://localhost:3001/api/card/",
                                                    accessToken: accessToken,
                                                    body: newCardInfo,
                                                    method: .post)
        let update: NewCardGetInfo
        
        do {
            update = try await URLSession.shared.execute(with: configuration, dataType: NewCardGetInfo.self)!
            cardInfo = update.value
            status = update.status
        } catch {
            print(error.localizedDescription)
        }
    }
}
