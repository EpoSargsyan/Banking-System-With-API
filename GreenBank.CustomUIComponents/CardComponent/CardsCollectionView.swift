//
//  CardsCollectionView.swift
//  GreenBank.CustomUIComponents
//
//  Created by Anna Hakobyan on 29.02.24.
//

import UIKit

public class ScrollingCardCollectionView: UICollectionView {
    public var cards: [Card] = []
    let layout = UPCarouselFlowLayout()
    
    public init() {
        super.init(frame: .zero, collectionViewLayout: layout)
        
        commonInit()
    }
    
    public init(cards: [Card]) {
        super.init(frame: .zero, collectionViewLayout: layout)
        self.register(EmptyCardCell.self, forCellWithReuseIdentifier: "empty_cell")
        self.register(CardCell.self, forCellWithReuseIdentifier: "cell")
        self.register(AddButtonCell.self, forCellWithReuseIdentifier: "addButton_cell")
        
        self.cards = cards
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        setupLayout()
        self.backgroundColor = AppColor.cremeWhite.uiColor
        self.showsHorizontalScrollIndicator = false
    }
    
    func setupLayout() {
        layout.itemSize = CGSize(width: 315, height: 184)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .horizontal
    }
}
