//
//  CategoryEntity+CoreDataClass.swift
//  VenueFinder
//
//  Created by Lizan on 21/12/2021.
//
//

import Foundation
import CoreData

@objc(CategoryEntity)
public class CategoryEntity: NSManagedObject, Decodable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case icon
    }

    required convenience public init(from decoder: Decoder) throws {

        guard let contextUserInfoKey = StringConstants.CoreDataContext.managedObjectContext, let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
              let entity = NSEntityDescription.entity(forEntityName: StringConstants.CoreDataEntity.categoryEntity, in: managedObjectContext)
        else {
            fatalError(StringConstants.decodeError)
        }
        self.init(entity: entity, insertInto: managedObjectContext)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decodeIfPresent(Double.self, forKey: .id) ?? 0
        self.name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.icon = try values.decodeIfPresent(IconEntity.self, forKey: .icon) ?? IconEntity.init()
    }
}
