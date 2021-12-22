//
//  GeoLocationsEntity+CoreDataClass.swift
//  VenueFinder
//
//  Created by Lizan on 21/12/2021.
//
//

import Foundation
import CoreData

@objc(GeoLocationsEntity)
public class GeoLocationsEntity: NSManagedObject, Decodable {
    
    enum CodingKeys: String, CodingKey {
        case main
    }

    required convenience public init(from decoder: Decoder) throws {

        guard let contextUserInfoKey = StringConstants.CoreDataContext.managedObjectContext, let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
          let entity = NSEntityDescription.entity(forEntityName: StringConstants.CoreDataEntity.geoLocationsEntity, in: managedObjectContext)
        else {
            fatalError(StringConstants.decodeError)
        }

        self.init(entity: entity, insertInto: managedObjectContext)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.geoPoint = try values.decodeIfPresent(GeoPointEntity.self, forKey: .main)

    }

}
