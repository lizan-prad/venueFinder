//
//  AddressEntity+CoreDataProperties.swift
//  VenueFinder
//
//  Created by Lizan on 21/12/2021.
//
//

import Foundation
import CoreData

extension AddressEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AddressEntity> {
        return NSFetchRequest<AddressEntity>(entityName: StringConstants.CoreDataEntity.addressEntity)
    }

    @NSManaged public var address: String?
    @NSManaged public var country: String?
    @NSManaged public var locality: String?
    @NSManaged public var postcode: String?
    @NSManaged public var region: String?
    @NSManaged public var ofVenue: VenueEntity?

}

extension AddressEntity: Identifiable {

}
