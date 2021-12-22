//
//  ResultEntity+CoreDataProperties.swift
//  VenueFinder
//
//  Created by Lizan on 21/12/2021.
//
//

import Foundation
import CoreData

extension ResultEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ResultEntity> {
        return NSFetchRequest<ResultEntity>(entityName: StringConstants.CoreDataEntity.resultEntity)
    }

    @NSManaged public var venue: Set<VenueEntity>?

}

// MARK: Generated accessors for venue
extension ResultEntity {

    @objc(addVenueObject:)
    @NSManaged public func addToVenue(_ value: VenueEntity)

    @objc(removeVenueObject:)
    @NSManaged public func removeFromVenue(_ value: VenueEntity)

    @objc(addVenue:)
    @NSManaged public func addToVenue(_ values: NSSet)

    @objc(removeVenue:)
    @NSManaged public func removeFromVenue(_ values: NSSet)

}

extension ResultEntity: Identifiable {

}
