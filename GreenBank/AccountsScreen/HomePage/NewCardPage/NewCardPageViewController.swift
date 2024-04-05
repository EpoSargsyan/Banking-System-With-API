//
//  NewCardPageViewController.swift
//  GreenBank
//
//  Created by Anna Hakobyan on 12.03.24.
//

import UIKit
import GreenBank_CustomUIComponents
import GreenBank_ViewModel

final class NewCardPageViewController: BaseViewController<NewCardViewModel> {
    let newCardView = NewCardPageView()
    var accounts: GetAccounts!
    var newCardInfo = NewCardInfo()
    
    override func viewDidLoad() {
        setup()
        setupViewModel()
        makeAnimation()
        accounts = AppDelegate.shared?.accounts
        newCardView.accountPicker.accounts = accounts.value
    }
    
    private func setupViewModel() {
        self.viewModel = NewCardViewModel()
    }
    
    func setup() {
        newCardView.setupUI()
        newCardView.frame = view.bounds
        view.addSubview(newCardView)
        view.backgroundColor = AppColor.cremeWhite.uiColor
        navigationItem.hidesBackButton = true
    }
    
    func makeAnimation() {
        let requestBtnAnimation = UIAction { _ in
            guard let viewModel = self.viewModel else { return } 
            guard let accessToken = AppDelegate.shared?.userRegisterInformation?.accessToken else { return }
            guard let userId = AppDelegate.shared?.userRegisterInformation?.user.id else { return }
            
            self.newCardInfo.cardType = self.newCardView.cardTypePicker.selectedTextField.text
            self.newCardInfo.currency = self.newCardView.currencyPicker.selectedTextField.text
            self.newCardInfo.userId = userId

            //MARK: Pti Poxvi notificationy 
//            Task {
//                do {
//                    try await viewModel.postNewCard(self.newCardInfo, accessToken: accessToken)
//                    
//                    if viewModel.status == "success" {
//                        NotificationCenter.default
//                                    .post(name: NSNotification.Name("accountCreatedSuccessfully"),
//                                          object: nil)
//                        
//                        let nextVC = RequestCompletedViewController()
//                        nextVC.flag = true
//                        self.navigationController?.pushViewController(nextVC, animated: true)
//                    } else {
//                        let nextVC = RequestCompletedViewController()
//                        nextVC.flag = false
//                        self.navigationController?.pushViewController(nextVC, animated: true)
//                    }
//                } catch {
//                    print(error)
//                }
//            }
        }
        
        let backButtonAction = UIAction { _ in
            self.navigationController?.popViewController(animated: true)
             
        }
        
        newCardView.backButton.addAction(backButtonAction, for: .touchUpInside)
        newCardView.requestButton.addAction(requestBtnAnimation, for: .touchUpInside)
    }
}
