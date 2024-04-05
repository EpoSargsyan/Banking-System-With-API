//
//  HomePageViewController.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 19.02.24.
//

import UIKit
import GreenBank_CustomUIComponents
import GreenBank_ViewModel

final public class HomePageViewController: BaseViewController<HomePageVIewModel> {
    let homePageView = HomePageView()
    
    let homePageTableView = HomePageAccountView()
    
    let cardsCounter = ScrollingCardCollectionView()
    
    let addNewAccountBtn = UIButton(backgroundColor: AppColor.primaryDefault.uiColor,
                                    title: "home_new_account_btn_text".localized)
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        Task {
            await getAllAccounts()
            await getAllCards()
        }
        makeAnimation()
        getNotification()
        setupUI()
    }
    
    func setupUI() {
        addNewAccountBtn.translatesAutoresizingMaskIntoConstraints = false
        
        homePageTableView.frame = view.bounds
        homePageTableView.backgroundColor = AppColor.cremeWhite.uiColor
        homePageTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        view.addSubview(homePageTableView)
        view.addSubview(addNewAccountBtn)
        
        NSLayoutConstraint.activate([
            addNewAccountBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -115),
            addNewAccountBtn.heightAnchor.constraint(equalToConstant: 48),
            addNewAccountBtn.widthAnchor.constraint(equalToConstant: 176),
            addNewAccountBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupViewModel() {
        self.viewModel = HomePageVIewModel()
    }
    
    func getAllCards() async {
        guard let viewModel = self.viewModel else { return }
        guard let userId = AppDelegate.shared?.userRegisterInformation?.user.id else { return }
        guard let accessToken = AppDelegate.shared?.userRegisterInformation?.accessToken else { return }
        
        do {
            let cards = try await viewModel.getAllCards(userId: userId, accessToken: accessToken)
            
            if let cardsData = cards?.value {
                self.homePageTableView.cardsData = cardsData
                self.homePageTableView.reloadData()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getAllAccounts() async {
        guard let viewModel = self.viewModel else { return }
        guard let userId = AppDelegate.shared?.userRegisterInformation?.user.id else { return }
        guard let accessToken = AppDelegate.shared?.userRegisterInformation?.accessToken else { return }
        
        do {
            let accounts = try await viewModel.getAllAccountns(userId: userId, accessToken: accessToken)
            
            AppDelegate.shared?.accounts = accounts
            
            self.homePageTableView.currentAcounts = (accounts!.value.filter { $0.accountType == "Current account" })
            
            self.homePageTableView.savingAccounts = (accounts!.value.filter { $0.accountType == "Saving account" })
            
            self.homePageTableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(tableViewSetup),
                                               name: NSNotification.Name("accountCreatedSuccessfully"),
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(requestNewCard),
                                               name: NSNotification.Name("requestNewCard"),
                                               object: nil)
    }
    
    @objc func tableViewSetup() {
        guard let viewModel = self.viewModel else { return }
        guard let userId = AppDelegate.shared?.userRegisterInformation?.user.id else { return }
        guard let accessToken = AppDelegate.shared?.userRegisterInformation?.accessToken else { return }
   
        Task {
            do {
                let accounts = try await viewModel.getAllAccountns(userId: userId, accessToken: accessToken)
                
                AppDelegate.shared?.accounts? = accounts! //hey
                
                self.homePageTableView.currentAcounts = (accounts!.value.filter { $0.accountType == "Current account" })
                
                self.homePageTableView.savingAccounts = (accounts!.value.filter { $0.accountType == "Saving account" })
                
                self.homePageTableView.reloadData()

            } catch {
                print(error)
            }
        }
    }
    
    @objc func requestNewCard() {
        let nextVC = NewCardPageViewController()
        nextVC.modalPresentationStyle = .fullScreen
        self.tabBarController?.tabBar.isHidden = true
        self.show(nextVC, sender: nil)
    }
    
    func makeAnimation() {
        let addNewAccAction = UIAction { _ in
            let nextVC = NewAccountViewController()
            nextVC.modalPresentationStyle = .fullScreen
            self.tabBarController?.tabBar.isHidden = true
            self.show(nextVC, sender: nil)
        }
        
        homePageView.addNewAccBtn.addAction(addNewAccAction, for: .touchUpInside)
        self.addNewAccountBtn.addAction(addNewAccAction, for: .touchUpInside)
    }
}
