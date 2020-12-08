//
//  TableViewHeader.swift
//  Checkk24TechTest
//
//  Created by Ajay Odedra on 20/09/20.
//  Copyright © 2020 Ajay Odedra. All rights reserved.
//

import UIKit
class TableViewHeader: UIView {
    
    @IBOutlet weak var numberOfComics: UILabel!
    @IBOutlet weak var characterName: UILabel!
    class func instanceFromNib() -> TableViewHeader {
        return UINib(nibName: "TableViewHeader", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! TableViewHeader
    }
}
