//
//  ToDo.swift
//  
//
//  Created by Werner on 30.12.15.
//
//

import Foundation
import CoreData

class ToDo: NSManagedObject {

    @NSManaged var todo_title: String
    @NSManaged var todo_description: String?
    @NSManaged var todo_date: NSDate

}
