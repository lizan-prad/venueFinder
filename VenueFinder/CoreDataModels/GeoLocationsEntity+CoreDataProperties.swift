//
//  GeoLocationsEntity+CoreDataProperties.swift
//  VenueFinder
//
//  Created by Lizan on 21/12/2021.
//
//

import Foundation
import CoreData


extension GeoLocationsEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GeoLocationsEntity> {
        return NSFetchRequest<GeoLocationsEntity>(entityName: StringConstants.CoreDataEntity.geoLocationsEntity)
    }

    @NSManaged public var geoPoint: GeoPointEntity?
    @NSManaged public var ofVenue: VenueEntity?

}

extension GeoLocationsEntity: Identifiable {

}
