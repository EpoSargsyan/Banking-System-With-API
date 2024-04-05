//
//  CardCell.swift
//  GreenBank.CustomUIComponents
//
//  Created by Anna Hakobyan on 29.02.24.
//

import UIKit

public class CardCell: UICollectionViewCell {
    public var card = Card()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        card.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(card)
        contentView.layer.cornerRadius = 30
        
        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: contentView.topAnchor),
            card.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            card.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            card.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
    }
    
    public func setupCardCell(card: Card) {
        let money = card.removeNonNumericCharacters(card.currentBalance.text ?? "")

        self.card.setupCard(_fullName: card.fullName.text ?? "???",
                            _cardType: card.cardTypeName,
                            _accountNumber: card.accountnumber,
                            _balance: money,
                            _currency: card.currency!,
                            _color: [card.colorGradient[0], card.colorGradient[1]], 
                            _data: card.data.text!)
    }
    
}

