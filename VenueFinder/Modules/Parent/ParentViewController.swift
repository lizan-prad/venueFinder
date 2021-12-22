//
//  ParentViewController.swift
//  VenueFinder
//
//  Created by Lizan on 21/12/2021.
//

import UIKit

class ParentViewController: UIViewController, Storyboarded {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var containerView: UIView!
    
    var viewModel: ParentViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = viewModel.title
        segmentedControl.selectedSegmentIndex = ParentViewModel.TabIndex.venues.rawValue
        displayCurrentTab(ParentViewModel.TabIndex.venues.rawValue)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let currentViewController = viewModel.currentViewController.value {
            currentViewController.viewWillDisappear(animated)
        }
    }
    
    @IBAction func segmentedControlDidChange(_ sender: UISegmentedControl) {
        viewModel.currentViewController.value!.view.removeFromSuperview()
        viewModel.currentViewController.value!.removeFromParent()
        displayCurrentTab(sender.selectedSegmentIndex)
    }
    
    func displayCurrentTab(_ tabIndex: Int){
        if let viewController = viewControllerForSelectedSegmentIndex(tabIndex) {
            self.containerView.addChildViewController(viewController, parentViewController: self)
            viewModel.currentViewController.value = viewController
        }
    }
    
    func getVenueListViewController() -> VenueListViewController? {
        guard let navigationController = self.navigationController else {return nil}
        let venuListCoordinator = VenueListCoordinator.init(navigationController: navigationController)
        return venuListCoordinator.getMainView()
    }
    
    func getAboutUsViewController() -> AboutUsViewController? {
        guard let navigationController = self.navigationController else {return nil}
        let aboutUsCoordinator = AboutUsCoordinator.init(navigationController: navigationController)
        return aboutUsCoordinator.getMainView()
    }
    
    func viewControllerForSelectedSegmentIndex(_ index: Int) -> UIViewController? {
        var selectedViewController: UIViewController?
        switch index {
        case ParentViewModel.TabIndex.venues.rawValue :
            selectedViewController = getVenueListViewController()
        case ParentViewModel.TabIndex.about.rawValue :
            selectedViewController = getAboutUsViewController()
        default:
            return nil
        }
        return selectedViewController
    }
}
