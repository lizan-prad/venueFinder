//
//  GeoPointEntity+CoreDataProperties.swift
//  VenueFinder
//
//  Created by Lizan on 21/12/2021.
//
//

import Foundation
import CoreData


extension GeoPointEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GeoPointEntity> {
        return NSFetchRequest<GeoPointEntity>(entityName: StringConstants.CoreDataEntity.geoPointEntity)
    }

    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var ofGeoLocations: GeoLocationsEntity?
    @NSManaged public var venue: VenueEntity?

}

extension GeoPointEntity : Identifiable {

}
