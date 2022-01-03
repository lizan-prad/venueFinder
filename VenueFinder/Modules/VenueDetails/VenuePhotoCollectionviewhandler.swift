//
//  VenuePhotoCollectionviewhandler.swift
//  VenueFinder
//
//  Created by Lizan on 03/01/2022.
//

import Foundation
import UIKit

protocol VenuePhotoCollectionViewDelegate {
    func didTapImage(image: UIImage?)
}

class VenuePhotoCollectionViewHandler: NSObject {
    
    var photos: [String]
    var delegate: VenuePhotoCollectionViewDelegate?
    
    init(photoList: [String]) {
        self.photos = photoList
    }
}

extension VenuePhotoCollectionViewHandler: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StringConstants.CollectionViewCells.venueImageCell, for: indexPath) as! VenueImageCollectionViewCell
        cell.imageUrl = photos[indexPath.row]
        return cell
    }
}

extension VenuePhotoCollectionViewHandler: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 44, height: 44)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! VenueImageCollectionViewCell
        self.delegate?.didTapImage(image: cell.venueImageView.image)
    }
}
