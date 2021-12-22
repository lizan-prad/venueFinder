//
//  ParentViewModel.swift
//  VenueFinder
//
//  Created by Lizan on 21/12/2021.
//

import UIKit

class ParentViewModel {
    
    var title = "Venue Finder"
    
    enum TabIndex : Int {
        case venues = 0
        case about = 1
    }
    
    var currentViewController: Observable<UIViewController> = Observable(nil)
}
 
