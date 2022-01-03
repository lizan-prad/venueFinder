//
//  VenueListTableViewHandler.swift
//  VenueFinder
//
//  Created by Lizan on 03/01/2022.
//

import UIKit

protocol VenueListTableViewDelegate {
    func didSelectItem(_ venueId: String?)
}


class VenueListTabeViewHandler: NSObject {
    
    var viewModel: VenueListViewModel!
    var delegate: VenueListTableViewDelegate?
    
    init(viewModel: VenueListViewModel) {
        self.viewModel = viewModel
    }
}

extension VenueListTabeViewHandler: UITableViewDataSource {
    
    
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

extension VenueListTabeViewHandler: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectItem(self.viewModel.getVenueId(indexPath.row))
    }
}
