//
//  AboutCoordinator.swift
//  VenueFinder
//
//  Created by Lizan on 22/12/2021.
//

import UIKit

class AboutUsCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = AboutUsViewController.instantiate()
        vc.viewModel = AboutUsViewModel()
        navigationController.pushViewController(vc, animated: false)
    }
    
    func getMainView() -> AboutUsViewController {
        let vc = AboutUsViewController.instantiate()
        vc.viewModel = AboutUsViewModel()
        return vc
    }
}
