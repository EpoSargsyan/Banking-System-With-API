//
//  CardsScreenView.swift
//  GreenBank
//
//  Created by Anna Hakobyan on 23.02.24.
//

import UIKit
import GreenBank_CustomUIComponents

class CardsScreenViewController: UIViewController {
    let c1 = Card()
    let c2 = Card()
    var collectionView: ScrollingCardCollectionView?
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        collectionView?.dataSource = self
        collectionView?.delegate = self
        
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.register(CardCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(collectionView!)
        collectionView?.frame = view.bounds
        
    }
}


extension CardsScreenViewController: UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("CardScreen Viewn a kanchum")
        return self.collectionView?.cards.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CardCell
        
        guard let cardData = self.collectionView?.cards[indexPath.item] else { return UICollectionViewCell() }
        
        cell.setupCardCell(card: cardData)//setting up the cell
        
        return cell
    }
}

extension CardsScreenViewController: UICollectionViewDelegate {
    
}
