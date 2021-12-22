//
//  VenueEntity+CoreDataProperties.swift
//  VenueFinder
//
//  Created by Lizan on 21/12/2021.
//
//

import Foundation
import CoreData

extension VenueEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<VenueEntity> {
        return NSFetchRequest<VenueEntity>(entityName: StringConstants.CoreDataEntity.venueEntity)
    }

    @NSManaged public var distance: Double
    @NSManaged public var fsq_id: String?
    @NSManaged public var name: String?
    @NSManaged public var venueTimeZone: String?
    @NSManaged public var categories: Set<CategoryEntity>?
    @NSManaged public var addressDetails: AddressEntity?
    @NSManaged public var geoLocations: GeoLocationsEntity?
    @NSManaged public var ofResult: ResultEntity?

}

// MARK: Generated accessors for categories
extension VenueEntity {

    @objc(addCategoriesObject:)
    @NSManaged public func addToCategories(_ value: CategoryEntity)

    @objc(removeCategoriesObject:)
    @NSManaged public func removeFromCategories(_ value: CategoryEntity)

    @objc(addCategories:)
    @NSManaged public func addToCategories(_ values: NSSet)

    @objc(removeCategories:)
    @NSManaged public func removeFromCategories(_ values: NSSet)

}

extension VenueEntity: Identifiable {

}
