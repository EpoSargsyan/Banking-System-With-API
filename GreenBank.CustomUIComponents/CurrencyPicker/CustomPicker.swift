//
//  CustomTableView.swift
//  GreenBank.CustomUIComponents
//
//  Created by Eprem Sargsyan on 20.02.24.
//

import UIKit
import GreenBank_ViewModel

public class CustomPicker: UIView, UITableViewDataSource, UITableViewDelegate {
    var dataForCurrency = [String]()
    var iconsForCurrency = [String]()
    public var showButton: UIButton
    public var selectedTextField: TextField
    public var customTable: UITableView
    public var selectedtext: String
    public var heightAnchorTableView: CGFloat
    public var isAccountPicker: Bool
    public var accounts: [AccountsInformation]?
    public weak var delegate: PassAccountInfoDelegate?
    
    public init(rightImageName: String,
                leftImageName: String,
                placeholder: String,
                tableViewHeight: CGFloat,
                currencyData: [String]? = nil,
                currencyIcons: [String]? = nil,
                isAccountPicker: Bool = false) {
        showButton = UIButton()
        selectedTextField = TextField(placeholder: placeholder,
                                 rightImage: rightImageName,
                                 leftImage: leftImageName)
        customTable = UITableView()
        selectedtext = ""
        self.isAccountPicker = isAccountPicker
        heightAnchorTableView = tableViewHeight
        self.dataForCurrency = currencyData ?? [""]
        self.iconsForCurrency = currencyIcons ?? [""]
        
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        customTable.delegate = self
        customTable.dataSource = self
        
        customTable.register(CustomTableViewCell.self,
                             forCellReuseIdentifier: "cell_text")
        customTable.register(AccountLinkingTableViewCell.self,
                             forCellReuseIdentifier: "account_cell")
        customTable.register(EmptyAccountCell.self,
                             forCellReuseIdentifier: "emptyAccount_cell")
        
        customTable.isScrollEnabled = false
        selectedTextField.translatesAutoresizingMaskIntoConstraints = false
        showButton.translatesAutoresizingMaskIntoConstraints = false
        
        selectedTextField.layer.cornerRadius = 8
        selectedTextField.layer.masksToBounds = true
        
        showButton.layer.borderColor = AppColor.grey200.uiColor.cgColor
        
        self.addSubview(selectedTextField)
        self.addSubview(showButton)
        
        showButton.backgroundColor = .none
        
        NSLayoutConstraint.activate([
            selectedTextField.topAnchor.constraint(equalTo: self.topAnchor),
            selectedTextField.leftAnchor.constraint(equalTo: self.leftAnchor),
            selectedTextField.rightAnchor.constraint(equalTo: self.rightAnchor),
            selectedTextField.heightAnchor.constraint(equalToConstant: 42)
        ])
        
        NSLayoutConstraint.activate([
            showButton.topAnchor.constraint(equalTo: selectedTextField.topAnchor),
            showButton.rightAnchor.constraint(equalTo: selectedTextField.rightAnchor),
            showButton.leftAnchor.constraint(equalTo: selectedTextField.leftAnchor),
            showButton.bottomAnchor.constraint(equalTo: selectedTextField.bottomAnchor)
        ])
        
        hideTableView()
        
        showButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    func setupTableViewDay() {
        dataForCurrency.removeAll()
        customTable.reloadData()
    }
    
    func hideTableView() {
        customTable.removeFromSuperview()
    }
    
    func showTableView() {
        customTable.isHidden = false
        customTable.separatorStyle = .none
        customTable.layer.borderWidth = 1
        customTable.layer.cornerRadius = 10
        
        customTable.layer.borderColor = AppColor.primaryFocus.uiColor.cgColor
        
        customTable.reloadData()
        
        customTable.translatesAutoresizingMaskIntoConstraints = false
        superview?.addSubview(customTable)
        
        NSLayoutConstraint.activate([
            customTable.topAnchor.constraint(equalTo: selectedTextField.bottomAnchor, constant: 10),
            customTable.leftAnchor.constraint(equalTo: superview!.leftAnchor, constant: 16),
            customTable.rightAnchor.constraint(equalTo: superview!.rightAnchor, constant: -16),
            customTable.heightAnchor.constraint(equalToConstant: heightAnchorTableView)
        ])
    }
    
    @objc func buttonTapped() {
        showTableView()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isAccountPicker ? accounts?.count ?? 0 + 1 : dataForCurrency.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isAccountPicker {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "emptyAccount_cell", for: indexPath) as! EmptyAccountCell
                cell.cellTextLabel.text = "New account"
                cell.backgroundColor = AppColor.cremeWhite.uiColor
                cell.cellTextLabel.textColor = AppColor.textBlack.uiColor
                
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "account_cell", for: indexPath) as! AccountLinkingTableViewCell
                
                if accounts?[indexPath.row].accountName == "" {
                    cell.cellTextLabel.text = accounts?[indexPath.row].accountType
                } else {
                    cell.cellTextLabel.text = accounts?[indexPath.row].accountName
                }
                
                cell.textUnderLabel.text = "\(accounts?[indexPath.row].currency ?? "") \(accounts?[indexPath.row].accountNumber ?? "")"
                cell.iconImageView.image = UIImage(named: accounts?[indexPath.row].accountType ?? "")
                cell.backgroundColor = AppColor.cremeWhite.uiColor
                cell.setup()
                
                return cell
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell_text", for: indexPath) as! CustomTableViewCell
            
            cell.iconImageView.image = UIImage(named: iconsForCurrency[indexPath.row])
            cell.backgroundColor = AppColor.cremeWhite.uiColor
            cell.cellTextLabel.text = "\(dataForCurrency[indexPath.row])"
            cell.cellTextLabel.textColor = AppColor.textBlack.uiColor
            cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
            
            return cell
        }
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isAccountPicker {
            if indexPath.row == 0 {
                selectedTextField.text = "New Account"
            } else {
//                selectedText.text = String(((accounts?[indexPath.row].accountName == "" ?
//                                             accounts?[indexPath.row].accountType : accounts?[indexPath.row].accountName)!))
//                                           + "\n" + (accounts?[indexPath.row].accountNumber)!)
                
//                if let account = accounts?[indexPath.row] {
                selectedTextField.text = accounts?[indexPath.row].accountNumber
                selectedtext = accounts?[indexPath.row].accountNumber ?? ""
                delegate?.passInfoFromFunction(accountInfo: selectedtext)
//                }
            }
        } else {
            selectedTextField.text = "\(dataForCurrency[indexPath.row])"
            selectedtext = dataForCurrency[indexPath.row]
        }
        
        hideTableView()
    }
}
