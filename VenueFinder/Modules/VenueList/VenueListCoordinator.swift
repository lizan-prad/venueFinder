//
//  VenueListCoordinator.swift
//  VenueFinder
//
//  Created by Lizan on 22/12/2021.
//

import UIKit

class VenueListCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = VenueListViewController.instantiate()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        vc.viewModel = VenueListViewModel.init(coreDataManager: CoreDataManager.init(context: context))
        navigationController.pushViewController(vc, animated: false)
    }
    
    func getMainView() -> VenueListViewController {
        let vc = VenueListViewController.instantiate()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        vc.viewModel = VenueListViewModel.init(coreDataManager: CoreDataManager.init(context: context))
        return vc
    }
}
