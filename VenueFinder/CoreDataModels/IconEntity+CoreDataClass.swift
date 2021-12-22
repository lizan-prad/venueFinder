//
//  IconEntity+CoreDataClass.swift
//  VenueFinder
//
//  Created by Lizan on 21/12/2021.
//
//

import Foundation
import CoreData

@objc(IconEntity)
public class IconEntity: NSManagedObject, Decodable {
    
    enum CodingKeys: String, CodingKey {
        case prefix
        case suffix
    }
    
    required convenience public init(from decoder: Decoder) throws {
        
        guard let contextUserInfoKey = StringConstants.CoreDataContext.managedObjectContext, let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
              let entity = NSEntityDescription.entity(forEntityName: StringConstants.CoreDataEntity.iconEntity, in: managedObjectContext)
        else {
            fatalError(StringConstants.decodeError)
        }
        self.init(entity: entity, insertInto: managedObjectContext)
        let defaultImageSize = "120"
        let values = try decoder.container(keyedBy: CodingKeys.self)
        guard let prefix = try values.decodeIfPresent(String.self, forKey: .prefix), let suffix = try values.decodeIfPresent(String.self, forKey: .suffix) else {return}
        self.iconUrl = prefix + defaultImageSize + suffix
    }
}
