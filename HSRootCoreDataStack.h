//
//  HSRootCoreDataStack.h
//  CoreDataTemplate
//
//  Created by Weston Hanners on 6/5/13.
//  Copyright (c) 2013 Hanners Software. All rights reserved.
//

@import Foundation;
@import CoreData;

@interface HSRootCoreDataStack : NSObject

@property (strong, nonatomic) NSManagedObjectContext        *rootContext;
@property (strong, nonatomic) NSManagedObjectContext        *unitTestContext;
@property (strong, nonatomic) NSPersistentStoreCoordinator  *persistentStoreCoordinator;
@property (strong, nonatomic) NSPersistentStore             *persistentStore;
@property (strong, nonatomic) NSManagedObjectModel          *managedObjectModel;

@end
