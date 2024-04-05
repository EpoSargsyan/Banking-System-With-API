//
//  HomePageLoadingStateViewController.swift
//  GreenBank
//
//  Created by Anna Hakobyan on 20.02.24.
//

import UIKit
import GreenBank_CustomUIComponents
import GreenBank_ViewModel

class HomePageLoadingStateViewController: BaseViewController<LoginViewModel> {
    let home = LoadingHomePageView()
    
    override func viewDidLoad() {
        setup()
        home.setup()
        setupViewModel()
        Task {
            await loginDisable()
        }
        
        print(AppDelegate.shared?.keyChain["password"])
    }
    
    func setup() {
        view.backgroundColor = AppColor.cremeWhite.uiColor
        home.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(home)
        NSLayoutConstraint.activate([
            home.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            home.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            home.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            home.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupViewModel() {
        self.viewModel = LoginViewModel()
    }
    
    func loginDisable() async {
        guard let email = UserDefaults.standard.string(forKey: "email") else { return }
        guard let password = AppDelegate.shared?.keyChain["password"] else { return }
        guard let viewModel = self.viewModel else { return }

        Task {
            do {
                let user = try await viewModel.getUser(withEmail: email, withPassword: password)
                AppDelegate.shared!.userRegisterInformation = user?.value
                
                let nextVC = TabBarViewController()
                nextVC.modalPresentationStyle = .fullScreen
                self.present(nextVC, animated: true)
            } catch {
                print(error)
            }
        }
    }
}
