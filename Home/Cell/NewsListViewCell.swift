//
//  NewsListViewCell.swift
//  Viper
//
//  Created by Mayank Kankrecha on 08/04/24.
//

import UIKit
import SDWebImage

class NewsListViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lblNews: UILabel!
    @IBOutlet weak var lblAuthorName: UILabel!
    @IBOutlet weak var imgNewsImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpUi(news: Articles?) {
        if let value = news {
            lblNews.text = value.title
            imgNewsImage.sd_setImage(with: URL(string: value.urlToImage ?? "") )
            if let author = value.author {
                lblAuthorName.text = "- \(author)"
            } else {
                lblAuthorName.isHidden = true
            }
        }
    }
    
}
