//
//  VenueDetailsCoordinator.swift
//  VenueFinder
//
//  Created by Lizan on 03/01/2022.
//

import UIKit

class VenueDetailsCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var venueId: String
    var coreDataManager: CoreDataManager
    
    
    init(navigationController: UINavigationController, venueId: String, coreDataManager: CoreDataManager) {
        self.navigationController = navigationController
        self.venueId = venueId
        self.coreDataManager = coreDataManager
    }

    func start() {
        let vc = VenueDetailsViewController.instantiate()
        vc.viewModel = VenueDetailsViewModel.init(venueId: self.venueId, coreDataManager: coreDataManager)
        vc.navigationItem.title = "Venue Images"
        navigationController.pushViewController(vc, animated: false)
    }

}
