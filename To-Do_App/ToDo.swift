//
//  ToDo.swift
//  To-Do_App
//
//  Created by Werner on 30.12.15.
//  Copyright (c) 2015 Werner. All rights reserved.
//

import Foundation
import CoreData
@objc(ToDo)

class ToDo: NSManagedObject {

    @NSManaged var todo_date: NSDate
    @NSManaged var todo_description: String
    @NSManaged var todo_title: String

}
