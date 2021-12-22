//
//  ParentCoordinator.swift
//  VenueFinder
//
//  Created by Lizan on 22/12/2021.
//

import UIKit

class ParentCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = ParentViewController.instantiate()
        vc.viewModel = ParentViewModel()
        let parentViewNavigationController = UINavigationController.init(rootViewController: vc)
        parentViewNavigationController.modalPresentationStyle = .fullScreen
        navigationController.present(parentViewNavigationController, animated: true, completion: nil)
    }
}
