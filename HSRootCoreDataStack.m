//
//  HSRootCoreDataStack.m
//  CoreDataTemplate
//
//  Created by Weston Hanners on 6/5/13.
//  Copyright (c) 2013 Hanners Software. All rights reserved.
//

#import "HSRootCoreDataStack.h"

@implementation HSRootCoreDataStack

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {

    if (_persistentStoreCoordinator)
        return _persistentStoreCoordinator;

    NSPersistentStoreCoordinator *poc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];

    NSError *error;

    NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];

    NSURL *storeURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@.sqlite", [self documentsDirectory], appName]];
    
	NSDictionary *optionsDict = @{NSMigratePersistentStoresAutomaticallyOption: @YES,
			                 	        NSInferMappingModelAutomaticallyOption: @YES};
	
    self.persistentStore = [poc addPersistentStoreWithType:NSSQLiteStoreType
                                             configuration:nil
                                                       URL:storeURL
                                                   options:optionsDict
                                                     error:&error];

    if (error)
        NSLog(@"%@", error);

    return poc;
}

- (NSManagedObjectModel *)managedObjectModel {

    if (_managedObjectModel)
        return _managedObjectModel;

    NSManagedObjectModel *mom = [NSManagedObjectModel mergedModelFromBundles:nil];

    return mom;

}

- (NSManagedObjectContext *)rootContext {

    if (_rootContext)
        return _rootContext;

    NSManagedObjectContext *rc = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueCurrencyType];

    if (!rc)
        NSLog(@"Unable to create Root Context");

    [rc setPersistentStoreCoordinator:self.persistentStoreCoordinator];

    return rc;

}

- (NSString *)documentsDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

@end
