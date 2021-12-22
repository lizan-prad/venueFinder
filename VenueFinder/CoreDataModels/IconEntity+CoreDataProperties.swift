//
//  IconEntity+CoreDataProperties.swift
//  VenueFinder
//
//  Created by Lizan on 21/12/2021.
//
//

import Foundation
import CoreData

extension IconEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<IconEntity> {
        return NSFetchRequest<IconEntity>(entityName: StringConstants.CoreDataEntity.iconEntity)
    }

    @NSManaged public var iconUrl: String?
    @NSManaged public var ofCategory: CategoryEntity?

}

extension IconEntity: Identifiable {

}
