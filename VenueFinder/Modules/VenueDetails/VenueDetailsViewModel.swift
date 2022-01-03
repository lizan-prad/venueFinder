//
//  VenueDetailsViewModel.swift
//  VenueFinder
//
//  Created by Lizan on 03/01/2022.
//

import Foundation

struct VenueDetails {
    
    var name: String?
    var images: [String]?
    var distance: String?
    var location: String?
}

class VenueDetailsViewModel {
    
    let venueId: String
    let coreDataManager: CoreDataManager
    
    init (venueId: String, coreDataManager: CoreDataManager) {
        self.venueId = venueId
        self.coreDataManager = coreDataManager
    }
    
    var venue: Observable<VenueDetails> = Observable(VenueDetails())
    var venueImages = [String]()
    
    func getVenueModel() {
        coreDataManager.loadSavedData(VenueEntity.self) { result in
            switch result {
            case .success(let venues):
                if let venue = Array(venues).filter({$0.fsq_id == self.venueId}).first {
                    self.venue.value = VenueDetails.init(name: venue.name, images: self.venueImages, distance: "\(venue.distance)", location: venue.addressDetails?.address)
                }
                
                break
            case .failure(_):
                break
            }
        }
    }
    
    func fetchVenueImages() {
        guard let url = URL.init(string: URLConfig.baseUrl + "places/\(venueId)/photos") else { return }
        NetworkManager.shared.request([VenuePhotoEntity].self, withEndpoint: url, params: [:]) { result in
            switch result {
            case .success(let models):
                self.venueImages = models.map({$0.prefix + "original" + $0.suffix})
                self.getVenueModel()
                break
            case .failure(_):
                break
            }
        }
    }
}
