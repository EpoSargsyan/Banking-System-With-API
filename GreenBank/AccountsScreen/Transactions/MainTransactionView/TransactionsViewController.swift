//
//  TransactionsViewController.swift
//  GreenBank
//
//  Created by Eprem Sargsyan on 20.02.24.
//

import UIKit
import GreenBank_CustomUIComponents
import GreenBank_ViewModel

final public class TransactionsViewController: UIViewController {
    let transactionView = TransactionsView()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        makeAnimations()
    }
    
    func setupUI() {
        transactionView.setupUI()
        view.backgroundColor = AppColor.cremeWhite.uiColor
        transactionView.frame = view.bounds
        view.addSubview(transactionView)
    }
    
    func makeAnimations() {
        let accountTransferAction = UIAction { _ in
            let nextVC = AccountTransfersViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
            self.tabBarController?.tabBar.isHidden = true
        }
        
        let qrTransferAction = UIAction { _ in
            let nextVC = QRTransferViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
            self.tabBarController?.tabBar.isHidden = true
        }
        
        transactionView.transferAccount.navigationBtn.addAction(accountTransferAction, for: .touchUpInside)
        transactionView.qrTransfer.navigationBtn.addAction(qrTransferAction, for: .touchUpInside)
    }
}
