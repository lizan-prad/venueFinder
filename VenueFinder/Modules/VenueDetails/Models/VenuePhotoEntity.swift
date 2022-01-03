//
//  VenuePhotoEntity+CoreDataProperties.swift
//  VenueFinder
//
//  Created by Lizan on 03/01/2022.
//
//

import Foundation
import CoreData


struct VenuePhotoEntity: Decodable {
    
    var id: String
    var prefix: String
    var suffix: String
    var width: Int64
    var height: Int64
    
    enum CodingKeys: String, CodingKey {
        case id
        case prefix
        case suffix
        case width
        case height
    }
    
    init(from decoder: Decoder) throws {

        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decodeIfPresent(String.self, forKey: .id) ?? ""
        self.prefix = try values.decodeIfPresent(String.self, forKey: .prefix) ?? ""
        self.suffix = try values.decodeIfPresent(String.self, forKey: .suffix) ?? ""
        self.width = try values.decodeIfPresent(Int64.self, forKey: .width) ?? 0
        self.height = try values.decodeIfPresent(Int64.self, forKey: .height) ?? 0
    }

}
