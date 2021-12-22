//
//  GeoPointEntity+CoreDataClass.swift
//  VenueFinder
//
//  Created by Lizan on 21/12/2021.
//
//

import Foundation
import CoreData

@objc(GeoPointEntity)
public class GeoPointEntity: NSManagedObject, Decodable {
    
    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
    }

    required convenience public init(from decoder: Decoder) throws {

        guard let contextUserInfoKey = StringConstants.CoreDataContext.managedObjectContext, let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
              let entity = NSEntityDescription.entity(forEntityName: StringConstants.CoreDataEntity.geoPointEntity, in: managedObjectContext)
        else {
            fatalError(StringConstants.decodeError)
        }
        self.init(entity: entity, insertInto: managedObjectContext)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.latitude = try values.decodeIfPresent(Double.self, forKey: .latitude) ?? 0
        self.longitude = try values.decodeIfPresent(Double.self, forKey: .longitude) ?? 0
    }
}
