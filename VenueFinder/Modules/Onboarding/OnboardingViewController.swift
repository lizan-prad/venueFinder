//
//  OnboardingViewController.swift
//  VenueFinder
//
//  Created by Lizan on 21/12/2021.
//

import UIKit

class OnboardingViewController: UIViewController, Storyboarded {

    var locationManager: LocationManager!
    var viewModel: OnboardingViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocationManager()
        bindViewModel()
    }
    
    func bindViewModel() {
        viewModel.location.bind { newLocation in
            self.openParentViewController()
        }
    }

    func setupLocationManager() {
        locationManager = LocationManager.shared
        locationManager.delegate = self
        locationManager.locationManager?.requestAlwaysAuthorization()
        locationManager.locationManager?.requestWhenInUseAuthorization()
        locationManager.locationManager?.startUpdatingLocation()
    }
    
    func openParentViewController() {
        guard let navigationController = self.navigationController else {return}
        let coordinator = ParentCoordinator.init(navigationController: navigationController)
        coordinator.start()
    }
}

extension OnboardingViewController: LocationManagerDelegate {
    
    func didUpdateLocation(_ manager: LocationManager, currentLocation location: LLocation?) {
        LocationManager.shared.currentLocation = location?.location
        if viewModel.location.value == nil {
            self.viewModel.location.value = location
        }
    }
    
    func locationManager(_ manager: LocationManager, needsToPresentAlertController alert: UIAlertController) {
        self.present(alert, animated: true, completion: nil)
    }

    func didAuthorizeAccess(_ manager: LocationManager) {
        if viewModel.location.value != nil {
            self.openParentViewController()
        }
    }

}
