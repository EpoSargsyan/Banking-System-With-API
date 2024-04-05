//
//  CardViewCell.swift
//  GreenBank.CustomUIComponents
//
//  Created by Eprem Sargsyan on 28.02.24.
//

import UIKit

final class CardViewCell: UITableViewCell {
    var collectionView: ScrollingCardCollectionView!
    var cardsCount: Int = 0
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupCollectionView()
//        collectionView.reloadData()
    }
   
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        self.frame.size.height = 240
    }
    
    func setupCollectionView() {
        collectionView = ScrollingCardCollectionView(cards: [])
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
//        collectionView.reloadData()
    }
    
    // Implement UICollectionViewDelegateFlowLayout methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item < self.collectionView.cards.count {
            // Size for regular card cells
            return CGSize(width: 315, height: 184)
        } else {
            // Size for the "Add Card" cell
            return CGSize(width: 30, height: 30)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension CardViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cardsCount == 0 ? 1 
        : self.cardsCount + 1 // for + button at the end of cards
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell
        // Check the condition for which cell to dequeue
        if self.cardsCount == 0 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "empty_cell", for: indexPath) as! EmptyCardCell
            (cell as? EmptyCardCell)?.setup() // Call setup method for EmptyCardCell
        } else {
            if indexPath.item < self.cardsCount {
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CardCell
                let cardData = self.collectionView.cards[indexPath.item]
                (cell as? CardCell)?.setupCardCell(card: cardData) // Call setup method for CardCell
                
            } else {
                // This is the last cell, return the "Add Card" cell
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: "addButton_cell", for: indexPath) as! AddButtonCell
                (cell as? AddButtonCell)?.setup()
            }
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension CardViewCell: UICollectionViewDelegate {

}
