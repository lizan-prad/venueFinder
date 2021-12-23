//
//  VenueListViewModel.swift
//  VenueFinder
//
//  Created by Lizan on 21/12/2021.
//

import UIKit

struct VenueListTableViewCellModel {
    
    var name: String?
    var address: String?
    var image: URL?
    var region: String?
    var index: Int?
    var distance: Double?
}

struct VenueListViewModel {
    
    var view: UIView?
    let coreDataManager: CoreDataManager
    
    let tableViewRowHeight: CGFloat = 255
    
    var venues: Observable<[VenueListTableViewCellModel]> = Observable([])
    
    func fetchVenues(failure: @escaping (UIAlertController) -> Void) {
        guard let url = URL.init(string: URLConfig.venueList), let coordinate = LocationManager.shared.currentLocation?.coordinate else {
            self.fetchSavedData()
            return
        }
        let param: [String:String] = ["ll": "\(coordinate.latitude),\(coordinate.longitude)"]
        self.view?.activityStartAnimating()
        NetworkManager.shared.request(ResultEntity.self, withEndpoint: url, params: param) { result in
            self.view?.activityStopAnimating()
            switch result {
            case .success( _):
                DispatchQueue.main.async {
                    coreDataManager.batchDelete(ResultEntity.self)
                    coreDataManager.saveContext()
                    self.fetchSavedData()
                }
            case .failure(let error):
                let alert = AlertServices.showAlertWithOkAction(title: nil, message: error.localizedDescription) { _ in
                    self.fetchSavedData()
                }
                failure(alert)
            }
        }
    }
    
    func fetchSavedData() {
        coreDataManager.loadSavedData(ResultEntity.self) { (result) in
            switch result {
            case .success(let models):
                if let models = models.first?.venue {
                    UserDefaults.standard.set(!models.isEmpty, forKey: StringConstants.UserDefaultsKey.appHasData)
                    self.venues.value = Array(Array(models).map({
                        VenueListTableViewCellModel.init(name: $0.name, address: $0.addressDetails?.address, image: URL.init(string: $0.categories?.first?.icon?.iconUrl ?? ""), region: $0.addressDetails?.region, index: 0, distance: $0.distance)
                    }).prefix(5))
                }
            case .failure(_):
                break
            }
        }
    }
    
}
