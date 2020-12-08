//
//  HeroInforTableViewCell.swift
//  MarvelHeroApp
//
//  Created by Ajay Odedra on 22/09/20.
//

import UIKit

class TableViewCellComicsInfo: UITableViewCell {
    @IBOutlet weak var mainContentView: UIView!
    @IBOutlet weak var heroImageView: CacheMemoryImageView!
    @IBOutlet weak var heroInfoLbl: UILabel!
    
    override func awakeFromNib() {
        heroImageView.setRoundedBorder()
        mainContentView.setRoundedBorder()
    }
    var viewModel: TableViewCellComicsInfoViewModel? {
        didSet {
            bindViewModel()
        }
    }
    
    private func bindViewModel() {
        guard let model = viewModel, let imageUrl = model.thumbnaiilUrl else {
            return
        }
        heroInfoLbl?.text = model.comic.title
        heroImageView.loadImage(atURL: imageUrl)
    }
    
}
