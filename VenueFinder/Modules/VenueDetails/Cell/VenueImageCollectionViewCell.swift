//
//  VenueImageCollectionViewCell.swift
//  VenueFinder
//
//  Created by Lizan on 03/01/2022.
//

import UIKit

class VenueImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var venueImageView: UIImageView!
    
    var imageUrl: String? {
        didSet {
            guard let url = imageUrl else {return}
            venueImageView.setImage(from: url)
        }
    }
    
    override func awakeFromNib() {
        self.venueImageView.setStandardCornerRadius()
    }
}
