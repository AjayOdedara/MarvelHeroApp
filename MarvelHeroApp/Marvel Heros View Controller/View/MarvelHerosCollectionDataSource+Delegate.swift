//
//  MarvelHerosCollectionDataSource+Delegate.swift
//  MarvelHeroApp
//
//  Created by Ajay Odedra on 27/09/20.
//

import UIKit

// MARK: Collection DataSource
extension MarvelHerosHomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.herosCells.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MarvelConstants.CellIdentifiers.collectionViewHeroCell, for: indexPath) as? CollectionViewHeroCell else{
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        guard let cell = cell as? CollectionViewHeroCell else {
            return
        }
        
        switch viewModel.herosCells.value[indexPath.row] {
        case .normal(let viewModel):
            cell.viewModel = viewModel
        case .error(let message):
            cell.heroNameLbl.text = message
            cell.isUserInteractionEnabled = false
        case .empty:
            cell.isUserInteractionEnabled = false
            cell.heroNameLbl.text = "No data available"
        }
        
        if viewModel.isLastIndexOfCollection(index: indexPath.row) {
            viewModel.getMarvelHeros()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? CollectionViewHeroCell else {
            return
        }
        cell.reducePriorityOfDownloadtaskForCell()
    }
    
}
// MARK: Collection Delegate
extension MarvelHerosHomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewHeroCell else {
            return
        }
        viewModel.comicsCells.value = []
        viewModel.headerData = HeaderData(headerTitle: cell.viewModel?.hero.name, comicCount: cell.viewModel?.hero.comicsInfo.available)
        viewModel.comicUrl = cell.viewModel?.hero.comicsCollectionUrl.absoluteString ?? ""
    }
}
