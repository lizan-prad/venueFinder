//
//  AddressEntity+CoreDataClass.swift
//  VenueFinder
//
//  Created by Lizan on 21/12/2021.
//
//

import Foundation
import CoreData

@objc(AddressEntity)
public class AddressEntity: NSManagedObject, Decodable {
    
    enum CodingKeys: String, CodingKey {
        case address
        case country
        case postcode
        case locality
        case region
    }
    
    required convenience public init(from decoder: Decoder) throws {
        guard let contextUserInfoKey = StringConstants.CoreDataContext.managedObjectContext, let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
              let entity = NSEntityDescription.entity(forEntityName: StringConstants.CoreDataEntity.addressEntity, in: managedObjectContext)
        else {
            fatalError(StringConstants.decodeError)
        }
        
        self.init(entity: entity, insertInto: managedObjectContext)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.address = try values.decodeIfPresent(String.self, forKey: .address)
        self.country = try values.decodeIfPresent(String.self, forKey: .country)
        self.locality = try values.decodeIfPresent(String.self, forKey: .locality)
        self.postcode = try values.decodeIfPresent(String.self, forKey: .postcode)
        self.region = try values.decodeIfPresent(String.self, forKey: .region)
    }
}
