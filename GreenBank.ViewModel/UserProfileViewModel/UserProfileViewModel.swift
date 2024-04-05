//
//  UserProfileViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Eprem Sargsyan on 14.03.24.
//

import Foundation
import GreenBank_Networking

final public class UserProfileViewModel: IUserProfileViewModel {
    public var validator: Validators
    public var status: String = ""
    
    public init() {
        validator = Validators.shared
    }
    
    public func getUserInfo(userId: String, accessToken: String) async throws -> UserProfileInfo? {
        
        let urlSessionConfiguration = URLSessionConfiguration(url: "http://localhost:3001/api/user/\(userId)",
                                                              accessToken: accessToken,
                                                              method: .get)
        
        do {
            return try await URLSession.shared.execute(with: urlSessionConfiguration,
                                                       dataType: UserProfileInfo.self)
        } catch {
            print(error.localizedDescription)
            throw HTTPNetworkError.UnwrappingError
        }
    }
    
    public func changeUserInfo(userId: String, accessToken: String, changeUserInfo: ChangeUserInfo) async throws -> UserProfileInfo? {
        
        let urlSessionConfiguration = URLSessionConfiguration(url: "https://greenbank1.coderepublic.am/api/user/\(userId)",
                                                              accessToken: accessToken,
                                                              body: changeUserInfo,
                                                              method: .patch)
        
        do {
            return try await URLSession.shared.execute(with: urlSessionConfiguration,
                                                       dataType: UserProfileInfo.self)
        } catch {
            print(error.localizedDescription)
            throw HTTPNetworkError.UnwrappingError
        }
    }
    
    public func changePassword(changePasswordInfo: ChangePasswordInfo, accessToken: String) async throws {
        
        let urlSessionConfiguration = URLSessionConfiguration(url: "http://localhost:3001/api/auth/changePassword",
                                                              accessToken: accessToken,
                                                              body: changePasswordInfo,
                                                              method: .patch)
        
        do {
            try await URLSession.shared.execute(with: urlSessionConfiguration,
                                                dataType: ChangePasswordGetInfo.self)
        } catch {
            print(error.localizedDescription)
            throw HTTPNetworkError.UnwrappingError
        }
    }
    
    public func checkingCurrentEmail(userEmail: CurrentEmailInfo, accessToken: String) async throws {
        
        let urlSessionConfiguration = URLSessionConfiguration(url: "http://localhost:3001/api/auth/change-email",
                                                              accessToken: accessToken,
                                                              body: userEmail,
                                                              method: .patch)
        
        do {
            try await URLSession.shared.execute(with: urlSessionConfiguration,
                                                dataType: CurrentEmailInfo.self)
        } catch {
            print(error.localizedDescription)
            throw HTTPNetworkError.UnwrappingError
        }
    }
    
    public func changeUserEmail(newEmail: NewEmailInfo, accessToken: String) async throws {
        let urlSessionConfiguration = URLSessionConfiguration(url: "http://localhost:3001/api/auth/new-email",
                                                              accessToken: accessToken,
                                                              body: newEmail,
                                                              method: .patch)
        
        do {
            try await URLSession.shared.execute(with: urlSessionConfiguration,
                                                dataType: NewEmailInfo.self)
        } catch {
            print(error.localizedDescription)
            throw HTTPNetworkError.UnwrappingError
        }
    }
}
