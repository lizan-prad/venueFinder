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
            if self.venueImageView.image != nil {
                self.venueImageView.activityStopAnimating()
                return
            }
            self.venueImageView.activityStartAnimating()
            venueImageView.setImage(from: url) {
                self.venueImageView.activityStopAnimating()
            }
        }
    }
    
    override func awakeFromNib() {
        self.venueImageView.setStandardCornerRadius()
    }
}
