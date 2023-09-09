//
//  CoreDataHandler.swift
//  Seamlabs Task
//
//  Created by Mariam on 09/09/2023.
//

import Foundation
import CoreData

class CoreDataHandler {
    public static var shared = CoreDataHandler()
    lazy var persistentContainer: NSPersistentContainer = {

        let modelURL = Bundle(for: type(of: self)).url(forResource: "HomeCoreDate", withExtension: "momd")!
        let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL)
        let container = NSPersistentContainer(name: "HomeCoreDate", managedObjectModel: managedObjectModel!)
            //let container = NSPersistentContainer(name: "InstabugNetworkClient")
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
            return container
        }()

    lazy var context: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    // MARK: - Core Data Saving support
    private func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    public func insert (from model: HomeModel) {
        let draftModel = model
        let entity = NSEntityDescription.entity(forEntityName: "HomeEntity", in: context)
        let newRequest = NSManagedObject(entity: entity!, insertInto: context)
        for articl in draftModel.articles ?? [] {
            newRequest.setValue(articl.title, forKey: "title")
            newRequest.setValue(articl.description, forKey: "descriptionHome")
            newRequest.setValue(articl.content, forKey: "content")
            newRequest.setValue(articl.author, forKey: "author")
            newRequest.setValue(articl.publishedAt, forKey: "publishedAt")
            newRequest.setValue(articl.urlToImage, forKey: "urlToImage")
            newRequest.setValue(articl.url, forKey: "url")
        }
        saveContext()
    }
    
    public func fetchAllRecords()-> [NSManagedObject]{
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "HomeEntity")
        
        do {
            let result = try context.fetch(request)
            return result as! [NSManagedObject]
        } catch {
            print("Failed")
            return []
        }
    }
    
    func getRecordsCount() -> Int {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "HomeEntity")
        do {
            let count = try context.count(for: fetchRequest)
            return count
        } catch {
            return 0
        }
    }
}
