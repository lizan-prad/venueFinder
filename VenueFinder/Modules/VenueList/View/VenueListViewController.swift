//
//  VenueListViewController.swift
//  VenueFinder
//
//  Created by Lizan on 21/12/2021.
//

import UIKit

class VenueListViewController: UIViewController, Storyboarded {

    var viewModel: VenueListViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self.view
        setupTableView()
        bindViewModel()
        getVenues()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
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

extension VenueListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.venues.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StringConstants.TableViewCells.venueListCell) as! VenueListTableViewCell
        var viewModel = self.viewModel.venues.value?[indexPath.row]
        viewModel?.index = indexPath.row
        cell.viewModel = viewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.tableViewRowHeight
    }
}

extension VenueListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
