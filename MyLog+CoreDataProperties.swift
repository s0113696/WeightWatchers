//
//  MyLog+CoreDataProperties.swift
//  WeightWatchers
//
//  Created by cis290 on 11/28/16.
//  Copyright © 2016 Rock Valley College. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension MyLog {

    @NSManaged var startpoints: NSNumber?
    @NSManaged var breakfast: NSNumber?
    @NSManaged var snack1: NSNumber?
    @NSManaged var lunch: NSNumber?
    @NSManaged var snack2: NSNumber?
    @NSManaged var dinner: NSNumber?
    @NSManaged var snack3: NSNumber?
    @NSManaged var endpoints: NSNumber?
    @NSManaged var todaysdate: NSDate?

}
