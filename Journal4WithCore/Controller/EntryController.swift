//
//  EntryController.swift
//  Journal4WithCore
//
//  Created by tyson ericksen on 11/14/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

import Foundation
import CoreData


class EntryController {
    
    static let sharedInstance = EntryController()
    
    var entries: [Entry] {
       
        do {
            try fetchResultsController.performFetch()
            guard let entries = fetchResultsController.fetchedObjects else { return [] }
            return entries
        } catch {
            print("error in retrieving information", error, error.localizedDescription)
            return []
        }
    }
    
    let fetchResultsController: NSFetchedResultsController<Entry> = {
        //creating the fetchrequest
        let fetchRequest: NSFetchRequest<Entry> = Entry.fetchRequest()
        //create a sort descriptor
        let titleSortDescription = NSSortDescriptor(key: "entryTitle", ascending: true)
        //assign descriptor to the fetchrequest
        fetchRequest.sortDescriptors = [titleSortDescription]
        
        return NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
    }()
    
    func addEntry(entryTitle: String, entryText: String) {
        _ = Entry(entryTitle: entryTitle, entryText: entryText)
        saveEntryToPersistentStorage()
    }
    
    func updateEntry(entry: Entry, entryTitle: String, entryText: String) {
        entry.entryText = entryText
        entry.entryTitle = entryTitle
        saveEntryToPersistentStorage()
    }
    
    func deleteEntry(entry: Entry) {
        CoreDataStack.managedObjectContext.delete(entry)
        saveEntryToPersistentStorage()
    }
    
    private func saveEntryToPersistentStorage() {
        do {
            try CoreDataStack.managedObjectContext.save()
        } catch {
            print("error in saving information", error, error.localizedDescription)
        }
    }
}
