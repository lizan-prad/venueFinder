//
//  VenueListViewController.swift
//  VenueFinder
//
//  Created by Lizan on 21/12/2021.
//

import UIKit

class VenueListViewController: UIViewController, Storyboarded {

    var viewModel: VenueListViewModel!
    var datasourceHandler: VenueListTabeViewHandler!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self.view
        setupTableView()
        bindViewModel()
        getVenues()
    }
    
    func setupTableView() {
        tableView.dataSource = datasourceHandler
        tableView.delegate = datasourceHandler
    }
    
    func bindViewModel() {
        self.viewModel.venues.bind {[weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func getVenues() {
        self.viewModel.fetchVenues { alert in
            self.present(alert, animated: true, completion: nil)
        }
    }

}

extension VenueListViewController: VenueListTableViewDelegate {
    
    func didSelectItem(_ venueId: String?) {
        guard let navigationController = self.navigationController, let id = venueId else {return}
        let venueDetailsCoordinator = VenueDetailsCoordinator.init(navigationController: navigationController, venueId: id, coreDataManager: viewModel.coreDataManager)
        venueDetailsCoordinator.start()
    }
   
}
