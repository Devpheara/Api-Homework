//
//  HomeTableViewCell.swift
//  Article Managements
//
//  Created by Eang Pheara on 12/14/16.
//  Copyright © 2016 Eang Pheara. All rights reserved.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var thumnailLabel: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var createDateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func customCell(article: Articles) {
        
        cellView.layer.cornerRadius = 5
        thumnailLabel?.layer.cornerRadius = 3
        
        titleLabel.text = article.title?.capitalized
        descriptionLabel.text = article.description
        createDateLabel.text = article.create_date
        thumnailLabel.kf.setImage(with: URL(string: (article.image?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed))!))
        

    }

}
