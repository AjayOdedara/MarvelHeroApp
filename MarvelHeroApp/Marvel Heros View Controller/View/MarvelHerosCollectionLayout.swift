//
//  MarvelHerosCollectionLayout.swift
//  MarvelHeroApp
//
//  Created by Ajay Odedra on 27/09/20.
//

import UIKit

// MARK: - UICollectionViewDelegateFlowLayout
extension MarvelHerosHomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return viewModel.countCellSizeForIndexPath()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return MarvelConstants.CollectionView.cellPadding/2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let padding = MarvelConstants.CollectionView.cellPadding
        return UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    }
    
}
