//
//  CategoryEntity+CoreDataProperties.swift
//  VenueFinder
//
//  Created by Lizan on 21/12/2021.
//
//

import Foundation
import CoreData


extension CategoryEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryEntity> {
        return NSFetchRequest<CategoryEntity>(entityName: StringConstants.CoreDataEntity.categoryEntity)
    }

    @NSManaged public var id: Double
    @NSManaged public var name: String?
    @NSManaged public var icon: IconEntity?
    @NSManaged public var ofVenue: VenueEntity?

}

extension CategoryEntity: Identifiable {

}
