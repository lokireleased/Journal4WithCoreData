//
//  Entry+Convience.swift
//  Journal4WithCore
//
//  Created by tyson ericksen on 11/14/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

import Foundation
import CoreData

extension Entry {
    
    convenience init(entryTitle: String, entryText: String) {
        self.init(context: CoreDataStack.managedObjectContext)
        self.entryTitle = entryTitle
        self.entryText = entryText
    }
}
