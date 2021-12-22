//
//  VenueListTableViewCell.swift
//  VenueFinder
//
//  Created by Lizan on 22/12/2021.
//

import UIKit

class VenueListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var venueNameLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var venueImage: UIImageView!
    @IBOutlet weak var gradientView: UIView!
    
    var viewModel: VenueListTableViewCellModel? {
        didSet {
            venueNameLabel.text = viewModel?.name
            addressLabel.text = viewModel?.address
            venueImage.setImage(from: URLConfig.RandomImageUrls.venueUrls[viewModel?.index ?? 0])
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    func setupViews() {
        self.containerView.addStandardBorder()
        self.gradientView.setGradient(UIColor.clear, endColor: UIColor.black.withAlphaComponent(1.0))
    }
    
}
