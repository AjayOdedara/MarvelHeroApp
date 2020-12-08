//
//  TableViewHerosCollectionCell.swift
//  MarvelHeroApp
//
//  Created by Ajay Odedra on 22/09/20.
//

import UIKit

class TableViewHerosCollectionCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCell()
    }
    func registerCell() {
        collectionView.register(UINib(
                                    nibName: MarvelConstants.CellIdentifiers.collectionViewHeroCell,
                                    bundle: nil),
                                forCellWithReuseIdentifier: MarvelConstants.CellIdentifiers.collectionViewHeroCell)
    }
}

extension TableViewHerosCollectionCell {
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
        
        
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
//        collectionView.setContentOffset(collectionView.contentOffset, animated:false) // Stops collection view if it was scrolling.
        collectionView.reloadData()
    }
    
    var collectionViewOffset: CGFloat {
        set { collectionView.contentOffset.x = newValue }
        get { return collectionView.contentOffset.x }
    }
}
