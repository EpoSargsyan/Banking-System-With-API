//
//  IUserProfileViewModel.swift
//  GreenBank.ViewModel
//
//  Created by Eprem Sargsyan on 14.03.24.
//

import Foundation

public protocol IUserProfileViewModel: IViewModel {
    var validator: Validators { get }
    func getUserInfo(userId: String, accessToken: String) async throws -> UserProfileInfo?
    func changeUserInfo(userId: String, accessToken: String, changeUserInfo: ChangeUserInfo) async throws -> UserProfileInfo?
    func checkingCurrentEmail(userEmail: CurrentEmailInfo, accessToken: String) async throws
    func changeUserEmail(newEmail: NewEmailInfo, accessToken: String) async throws
    func changePassword(changePasswordInfo: ChangePasswordInfo, accessToken: String) async throws
}
