//
//  AboutIsViewModel.swift
//  VenueFinder
//
//  Created by Lizan on 21/12/2021.
//

import Foundation

class AboutUsViewModel {
    
    func getMainView() -> AboutUsViewController {
        return AboutUsViewController.instantiateFromStoryboard(StoryboardConstants.aboutUs)
    }
}
