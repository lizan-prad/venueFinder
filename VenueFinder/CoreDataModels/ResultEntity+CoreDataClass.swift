//
//  ResultEntity+CoreDataClass.swift
//  VenueFinder
//
//  Created by Lizan on 21/12/2021.
//
//

import Foundation
import CoreData

@objc(ResultEntity)
public class ResultEntity: NSManagedObject, Decodable {
    
    enum CodingKeys: String, CodingKey {
        case results
    }

    required convenience public init(from decoder: Decoder) throws {
        
        guard let contextUserInfoKey = StringConstants.CoreDataContext.managedObjectContext, let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
              let entity = NSEntityDescription.entity(forEntityName: StringConstants.CoreDataEntity.resultEntity, in: managedObjectContext)
        else {
            fatalError(StringConstants.decodeError)
        }
        self.init(entity: entity, insertInto: managedObjectContext)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.venue = try values.decodeIfPresent(Set<VenueEntity>.self, forKey: .results)
    }
}
