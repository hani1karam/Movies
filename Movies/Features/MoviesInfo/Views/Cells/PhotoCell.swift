//
//  PhotoCell.swift
//  Movies
//
//  Created by hany karam on 3/31/22.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    @IBOutlet var moviePhotoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        moviePhotoImageView.layer.cornerRadius = 10.0
    }
}
