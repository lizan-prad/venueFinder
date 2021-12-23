//
//  AboutIsViewModel.swift
//  VenueFinder
//
//  Created by Lizan on 21/12/2021.
//

import Foundation

class AboutUsViewModel {
    
    var appVersion: String? {
        return "App Version \((Bundle.main.infoDictionary?[StringConstants.bundleVersionString] as? String) ?? "")"
    }
    
    var aboutUsDescriptionString: String? {
        return StringConstants.appDescriptionString
    }
}
