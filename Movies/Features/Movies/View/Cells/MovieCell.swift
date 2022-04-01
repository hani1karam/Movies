//
//  MovieCell.swift
//  Movies
//
//  Created by hany karam on 3/31/22.
//

import UIKit

class MovieCell: UITableViewCell {
    @IBOutlet var movieTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configure(title: String) {
        self.movieTitleLabel.text = title
    }
    
}
