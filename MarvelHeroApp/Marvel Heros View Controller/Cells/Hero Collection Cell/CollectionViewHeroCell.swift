//
//  CollectionViewHeroCell.swift
//  MarvelHeroApp
//
//  Created by Ajay Odedra on 22/09/20.
//

import UIKit

class CollectionViewHeroCell: UICollectionViewCell {
    
    @IBOutlet weak var mainContentView: UIView!
    @IBOutlet weak var heroImageView: CacheMemoryImageView!
    @IBOutlet weak var heroNameLbl: UILabel!
    
    override func awakeFromNib() {
        heroImageView.layer.cornerRadius = 5
        mainContentView.setRoundedBorder()
    }
    var viewModel: CollectionViewHeroCellViewModel? {
        didSet {
            bindViewModel()
        }
    }
    
    private func bindViewModel() {
        guard let model = viewModel, let imageUrl = model.thumbnaiilUrl else {
            return
        }
        heroNameLbl?.text = model.hero.name
        heroImageView.loadImage(atURL: imageUrl)
    }
    
    func reducePriorityOfDownloadtaskForCell() {
        // TODO: Manage data task
        //AppServerClient.sharedInstance.reducePriorityOfTask(withURL: imageUrl)
    }
    
}
