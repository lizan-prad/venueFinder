//
//  OnboardingCoordinator.swift
//  VenueFinder
//
//  Created by Lizan on 22/12/2021.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = OnboardingViewController.instantiate()
        vc.viewModel = OnboardingViewModel()
        navigationController.pushViewController(vc, animated: false)
    }
}
