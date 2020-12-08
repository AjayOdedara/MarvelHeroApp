//
//  MarvelHerosHomeViewDataDelegate.swift
//  MarvelHeroApp
//
//  Created by Ajay Odedra on 27/09/20.
//

import UIKit

// MARK: - Tableview DataSource & Delegate
extension MarvelHerosHomeViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return TableCellContentType.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch TableCellContentType(rawValue: section){
        case .heros:
            return 1
            
        case .information:
            let count = viewModel.comicsCells.value.count
            return count
            
        case .none:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch TableCellContentType(rawValue: indexPath.section){
        case .heros:
            let cell = tableView.dequeueReusableCell(withIdentifier: MarvelConstants.CellIdentifiers.tableViewHerosCollectionCell, for: indexPath)
            return cell
            
        case .information:
            let cell = tableView.dequeueReusableCell(withIdentifier: MarvelConstants.CellIdentifiers.tableViewHeroInformationCell, for: indexPath)
            return cell
            
        case .none:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        switch TableCellContentType(rawValue: indexPath.section){
        case .heros:
            guard let tableViewCell = cell as? TableViewHerosCollectionCell else { return }
            tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
            tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
            
        case .information:
            guard let cell = cell as? TableViewCellComicsInfo else { return }
            
            switch viewModel.comicsCells.value[safe: indexPath.row] {
            case .normal(let viewModel):
                cell.viewModel = viewModel
                
            case .error, .empty, .none:
                cell.heroInfoLbl.text = "non"
            }
            
            if viewModel.isLastIndexOfTable(index: indexPath.row) {
                viewModel.getHeroComics(from: viewModel.comicUrl ?? "")
            }
            
        case .none:
            DLog("Got an error")
        }
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        switch TableCellContentType(rawValue: indexPath.section){
        case .heros:
            guard let tableViewCell = cell as? TableViewHerosCollectionCell else { return }
            tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
            tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
            
        case .information:
            guard cell is TableViewCellComicsInfo else { return }
            
        case .none:
            DLog("Got an error")
        }
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let headerData = viewModel.headerData else {
            return UIView()
        }
        
        switch TableCellContentType(rawValue: section){
        case .information:
            let headerView = TableViewHeader.instanceFromNib()
            headerView.characterName.text = headerData.headerTitle
            headerView.numberOfComics.text = MarvelConstants.View.tableHeaderPlaceHolder + " \(headerData.comicCount ?? 0)"
            return headerView
            
        default:
            return UIView()
        }
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        guard viewModel.headerData != nil else {
            return 0
        }
        
        switch TableCellContentType(rawValue: section){
        case .information:
            return 50
        default:
            return 0
        }
        
    }
    
}
