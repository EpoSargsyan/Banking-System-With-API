//
//  TabBarViewController.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 20.02.24.
//

import UIKit
import GreenBank_CustomUIComponents

final public class TabBarViewController: UITabBarController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.layer.borderWidth = 0.5
        self.tabBar.layer.borderColor = AppColor.primaryFocus.uiColor.cgColor
        self.tabBar.backgroundColor = AppColor.cremeWhite.uiColor
        self.setupTabs()
    }
    
    private func setupTabs() {
        let homeVC = self.createNav(title: "Home",
                                    image: "home",
                                    vc: HomePageViewController())
        
        let transactionsVC = self.createNav(title: "transactions",
                                            image: "transactions",
                                            vc: TransactionsViewController())
        
        let historyVC = self.createNav(title: "history",
                                       image: "history",
                                       vc: HistoryViewController())
        
        let financingVC = self.createNav(title: "Financing",
                                         image: "financing",
                                         vc: FinancingPageViewController())
        
        let profileVC = self.createNav(title: "profile",
                                       image: "profile",
                                       vc: ProfileViewController())
        
        self.setViewControllers([homeVC, transactionsVC, historyVC, financingVC, profileVC], animated: true)
    }
    
    private func createNav(title: String, image: String, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
        
        let titleColor: UIColor = AppColor.textGrey.uiColor
        let selectedTitleColor = AppColor.primaryFocus.uiColor
        let iconTintColor = AppColor.primaryFocus.uiColor
        
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: titleColor
        ]
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: selectedTitleColor
        ]
        
        nav.tabBarItem.setTitleTextAttributes(normalAttributes, for: .normal)
        nav.tabBarItem.setTitleTextAttributes(selectedAttributes, for: .selected)
        
        nav.tabBarItem.selectedImage = nav.tabBarItem.selectedImage?.withTintColor(iconTintColor,
                                                         renderingMode: .alwaysOriginal)
        
        return nav
    }
    
}
