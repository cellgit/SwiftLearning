//
//  HotKeysCell.swift
//  SketchCollage
//
//  Created by 刘宏立 on 2018/10/31.
//  Copyright © 2018 lhl. All rights reserved.
//

import UIKit
import SnapKit

class HotKeysCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var titleLabelConst: NSLayoutConstraint!
    
    
    var model: HotkeysModel! {
        didSet {
            self.titleLabel.text = model.hotkey
            self.contentLabel.text = model.function
            self.descLabel.text = "NO.\(model.id)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI() {
        self.titleLabel.isSkeletonable = true
        self.contentLabel.isSkeletonable = true
        self.descLabel.isSkeletonable = true
    }
    
}
