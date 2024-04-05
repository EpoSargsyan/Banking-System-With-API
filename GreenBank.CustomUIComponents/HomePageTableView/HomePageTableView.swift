//
//  HomePageTableView.swift
//  GreenBank.CustomUIComponents
//
//  Created by Eprem Sargsyan on 28.02.24.
//
//

import UIKit
import GreenBank_ViewModel

public final class HomePageAccountView: UITableView, UICollectionViewDelegate {
    var selectedSegment: Int
    public var cardsData: [CardsDetails] = []
    public var currentAcounts: [AccountsInformation] = []
    public var savingAccounts: [AccountsInformation] = []
    public var cardsColors: [GradientColor] = [
        GradientColor(start: "#5CC623", end: "#308900"),
        GradientColor(start: "#59DCAC", end: "#35896B"),
        GradientColor(start: "#4AE7F1", end: "#2D8E95"),
        GradientColor(start: "#4AC9F1", end: "#389BBA"),
        GradientColor(start: "#4A6FF1", end: "#334EAD"),
        GradientColor(start: "#6966FE", end: "#4947B1"),
        GradientColor(start: "#835FEA", end: "#674DB4"),
        GradientColor(start: "#9F5DE2", end: "#7747A7"),
        GradientColor(start: "#DA6DEC", end: "#B052BF"),
        GradientColor(start: "#F777D3", end: "#C15DA5"),
        GradientColor(start: "#FF598B", end: "#D13161"),
        GradientColor(start: "#E64343", end: "#BE3434"),
        GradientColor(start: "#FF5C46", end: "#CF4E3C"),
        GradientColor(start: "#FF932F", end: "#DD8535"),
        GradientColor(start: "#FAC231", end: "#D6A62B"),
        GradientColor(start: "#C6ED2C", end: "#8BA81A")
    ]
    
    public init() {
        selectedSegment = 0
        
        super.init(frame: .zero, style: .plain)
        
        setupCells()
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCells() {
        self.delegate = self
        self.dataSource = self
        
        self.register(CardViewCell.self, forCellReuseIdentifier: "card_cell")
        self.register(SegmentPickerCell.self, forCellReuseIdentifier: "segment_cell")
        self.register(AccountCell.self, forCellReuseIdentifier: "account_cell")
    }
    
    func setupTableView() {
        self.separatorStyle = .none
        self.reloadData()
    }
    
    @objc func segmentControl(_ segmentedControl: UISegmentedControl) {
        self.selectedSegment = segmentedControl.selectedSegmentIndex
        self.reloadData()
    }
}

extension HomePageAccountView: UITableViewDelegate {
    
}

extension HomePageAccountView: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.selectedSegment == 0 {
            return currentAcounts.count + 2
        } else {
            return savingAccounts.count + 2
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "card_cell",
                                                     for: indexPath) as! CardViewCell
            
            cell.backgroundColor = AppColor.cremeWhite.uiColor
            cell.bringSubviewToFront(cell.collectionView)
            cell.selectionStyle = .none
            cell.cardsCount = cardsData.count
            
            if cardsData.count != 0 {
                for i in 0..<cardsData.count {
                    let card = Card()
                    card.setupCard(_fullName: cardsData[i].cardHolderName,
                                   _cardType: cardsData[i].cardType,
                                   _accountNumber: cardsData[i].cardNumber,
                                   _balance: String(cardsData[i].balance),
                                   _currency: Currency(rawValue: cardsData[i].currency)!.symbol,
                                   _color: [cardsData[i].color!.start,
                                            cardsData[i].color!.end],
                                   _data: cardsData[i].expirationDate)
                    cell.collectionView.cards.append(card)
                }
            }
            cell.collectionView.reloadData()
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "segment_cell",
                                                     for: indexPath) as! SegmentPickerCell
            cell.accountLabel.text = "home_account_text".localized
            cell.bringSubviewToFront(cell.accountLabel)
            cell.bringSubviewToFront(cell.segmentPicker)
            cell.selectionStyle = .none
            cell.backgroundColor = AppColor.cremeWhite.uiColor
            cell.segmentPicker.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "account_cell",
                                                     for: indexPath) as! AccountCell
            
            switch (selectedSegment) {
            case 0:
                cell.accountNumberLabel.text = currentAcounts[indexPath.row - 2].accountNumber
                cell.moneyCountLabel.text = "\(currentAcounts[indexPath.row - 2].balance)"
                
                if currentAcounts[indexPath.row - 2].accountName == "" {
                    cell.accountNameLabel.text = currentAcounts[indexPath.row - 2].accountType
                } else {
                    cell.accountNameLabel.text = currentAcounts[indexPath.row - 2].accountName
                }
            case 1:
                cell.accountNumberLabel.text = savingAccounts[indexPath.row - 2].accountNumber
                cell.moneyCountLabel.text = "\(savingAccounts[indexPath.row - 2].balance)"
                
                if savingAccounts[indexPath.row - 2].accountName == "" {
                    cell.accountNameLabel.text = savingAccounts[indexPath.row - 2].accountType
                } else {
                    cell.accountNameLabel.text = savingAccounts[indexPath.row - 2].accountName
                }
            default:
                fatalError()
            }
            
            cell.backgroundColor = AppColor.cremeWhite.uiColor
            return cell
        }
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return CardViewCell().bounds.height
        case 1:
            return SegmentPickerCell().bounds.height
        case 2...indexPath.row:
            return AccountCell().bounds.height
        default:
            fatalError()
        }
    }
}

