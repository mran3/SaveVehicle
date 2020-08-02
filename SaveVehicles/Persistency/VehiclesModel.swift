//
//  DatabaseController.swift
//  SaveVehicle
//
//  Created by mran3 on 2/8/20.
//  Copyright © 2020 mran3. All rights reserved.
//

import UIKit
import CoreData


class VehiclesModel: NSObject {
    override init() {}

    //Returns the current Persistent Container for CoreData
    class func getContext () -> NSManagedObjectContext {
        return VehiclesModel.persistentContainer.viewContext
    }


    static var persistentContainer: NSPersistentContainer = {
        //The container that holds both data model entities
        let container = NSPersistentContainer(name: "CarsModel")

        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }


        })
        return container
    }()

    // MARK: - Core Data Saving support
    class func saveContext() {
        let context = self.getContext()
        if context.hasChanges {
            do {
                try context.save()
                print("Data Saved to Context")
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate.
                //You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    /* Support for GRUD Operations */

    // GET / Fetch / Requests
    class func getAllVehicles() -> Array<Vehicles> {
        let all = NSFetchRequest<Vehicles>(entityName: "Vehicles")
        var allPlayers = [Vehicles]()

        do {
            let fetched = try VehiclesModel.getContext().fetch(all)
            allPlayers = fetched
        } catch {
            let nserror = error as NSError
            //TODO: Handle Error
            print(nserror.description)
        }

        return allPlayers
    }
    
    //delete all players from coredata
    class func deleteAllUsers() {
        do {
            let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
            let deleteALL = NSBatchDeleteRequest(fetchRequest: deleteFetch)

            try VehiclesModel.getContext().execute(deleteALL)
            VehiclesModel.saveContext()
        } catch {
            print ("There is an error in deleting records")
        }
    }

}
