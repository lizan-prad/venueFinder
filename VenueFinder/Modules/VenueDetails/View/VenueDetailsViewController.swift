//
//  VenueDetailsViewController.swift
//  VenueFinder
//
//  Created by Lizan on 03/01/2022.
//

import UIKit

class VenueDetailsViewController: UIViewController, Storyboarded {

    var viewModel: VenueDetailsViewModel!
    
    @IBOutlet weak var venueNameLabel: UILabel!
    @IBOutlet weak var venuePhotoCollectionView: UICollectionView!
    @IBOutlet weak var photoView: UIImageView!
    var handler: VenuePhotoCollectionViewHandler!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindViewModel()
    } 
    
    func bindViewModel() {
        self.viewModel.venue.bind { model in
            self.venueNameLabel.text = model?.name
            self.handler = VenuePhotoCollectionViewHandler.init(photoList: model?.images ?? [])
            self.photoView.setImage(from: model?.images?.first ?? "")
            self.setupCollectionView()
        }
    }
    
    func setupView() {
        self.photoView.setStandardCornerRadius()
        self.viewModel.fetchVenueImages()
    }
    
    func setupCollectionView() {
        handler.delegate = self
        venuePhotoCollectionView.dataSource = handler
        venuePhotoCollectionView.delegate = handler
    }

}

extension VenueDetailsViewController: VenuePhotoCollectionViewDelegate {
    
    func didTapImage(image: UIImage?) {
        self.photoView.image = image
    }

}
