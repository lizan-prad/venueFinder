//
//  AboutUsViewController.swift
//  VenueFinder
//
//  Created by Lizan on 21/12/2021.
//

import UIKit

class AboutUsViewController: UIViewController, Storyboarded {

    @IBOutlet weak var appVersionLabel: UILabel!
    @IBOutlet weak var aboutUsDescLabel: UILabel!
    
    var viewModel: AboutUsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    func setupView() {
        self.appVersionLabel.text = viewModel.appVersion
        self.aboutUsDescLabel.text = viewModel.aboutUsDescriptionString
    }
    
}
