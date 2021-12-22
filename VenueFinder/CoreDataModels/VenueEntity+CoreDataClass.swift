//
//  VenueEntity+CoreDataClass.swift
//  VenueFinder
//
//  Created by Lizan on 21/12/2021.
//
//

import Foundation
import CoreData

@objc(VenueEntity)
public class VenueEntity: NSManagedObject, Decodable {

    enum CodingKeys: String, CodingKey {
        case fsqId = "fsq_id"
        case distance
        case name
        case timezone
        case categories
        case geocodes
        case location
    }

    required convenience public init(from decoder: Decoder) throws {

        guard let contextUserInfoKey = StringConstants.CoreDataContext.managedObjectContext, let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
              let entity = NSEntityDescription.entity(forEntityName: StringConstants.CoreDataEntity.venueEntity, in: managedObjectContext)
        else {
            fatalError(StringConstants.decodeError)
        }

        self.init(entity: entity, insertInto: managedObjectContext)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.fsq_id = try values.decodeIfPresent(String.self, forKey: .fsqId)
        self.distance = try values.decodeIfPresent(Double.self, forKey: .distance) ?? 0
        self.name = try values.decodeIfPresent(String.self, forKey: .name)
        self.venueTimeZone = try values.decodeIfPresent(String.self, forKey: .timezone)
        self.categories = try values.decodeIfPresent(Set<CategoryEntity>.self, forKey: .categories)
        self.geoLocations = try values.decodeIfPresent(GeoLocationsEntity.self, forKey: .geocodes)
        self.addressDetails = try values.decodeIfPresent(AddressEntity.self, forKey: .location)
    }

}
