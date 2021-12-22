//
//  CoreDataManager.swift
//  VenueFinder
//
//  Created by Lizan on 21/12/2021.
//

import UIKit
import CoreData

class CoreDataManager {
    
    var context: NSManagedObjectContext!
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func saveContext() {
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    func batchDelete<T: NSManagedObject>(_ type: T.Type) {
        T.deleteAll(context: context)
    }
    
    func loadSavedData<T: NSManagedObject>(_ type: T.Type, completion: @escaping (Result<[T],Error>) -> Void) {
        let request: NSFetchRequest<T> = T.fetchRequest() as! NSFetchRequest<T>
        do {
            let data: [T] = try context.fetch(request)
            completion(.success(data))
        } catch {
            completion(.failure(error))
        }
    }
}

extension NSManagedObject {
    
    public func delete(context: NSManagedObjectContext) {
        context.delete(self)
    }
    
    public static func deleteAll(context: NSManagedObjectContext) {
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: self.fetchRequest())
        do {
            try context.execute(batchDeleteRequest)
        } catch {
        }
    }
}
