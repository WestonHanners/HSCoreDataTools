//
//  HSRootCoreDataStack.m
//  CoreDataTemplate
//
//  Created by Weston Hanners on 6/5/13.
//  Copyright (c) 2013 Hanners Software. All rights reserved.
//

#import "HSRootCoreDataStack.h"

NSString *CFBundleName = @"CFBundleName";

@implementation HSRootCoreDataStack {
    bool usesMemoryContext;
}

- (instancetype)init {
    
    if ((self = [super init])) {
        usesMemoryContext = NO;
    }
    return self;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {

    if (_persistentStoreCoordinator) {
        return _persistentStoreCoordinator;
    }

    NSPersistentStoreCoordinator    *poc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
    NSError                         *error = nil;
    NSString                        *storeType = NSSQLiteStoreType;
    NSURL                           *storeURL = [self storeURL];
    
	NSDictionary                    *optionsDict = @{NSMigratePersistentStoresAutomaticallyOption: @YES,
                                                     NSInferMappingModelAutomaticallyOption: @YES};

    if (usesMemoryContext) {
        storeType = NSInMemoryStoreType;
        storeURL = nil;
        
    }
    
    self.persistentStore = [poc addPersistentStoreWithType:storeType
                                             configuration:nil
                                                       URL:storeURL
                                                   options:optionsDict
                                                     error:&error];

    if (error) {
        NSLog(@"%@", error);
    }

    return poc;
}

- (NSManagedObjectModel *)managedObjectModel {

    if (_managedObjectModel) {
        return _managedObjectModel;
    }

    NSManagedObjectModel *mom = [NSManagedObjectModel mergedModelFromBundles:nil];

    return mom;

}

- (NSManagedObjectContext *)rootContext {
    
    if (usesMemoryContext) {
        NSLog(@"Using In-Memory Context");
    }

    if (_rootContext) {
        return _rootContext;
    }

    NSManagedObjectContext *rc = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];

    if (!rc) {
        NSLog(@"Unable to create Root Context");
    }

    [rc setPersistentStoreCoordinator:self.persistentStoreCoordinator];

    return rc;
}

- (NSManagedObjectContext *)unitTestContext {
    
        // Set flag to generate context in memory.
    usesMemoryContext = YES;
    return [self rootContext];
}

- (void)resetStack {
    NSError *removeError = nil;
    
    bool success = [_persistentStoreCoordinator removePersistentStore:_persistentStore error:&removeError];
    
    if (!success) {
        NSLog(@"Error resetting NSPersistentStore: %@", removeError.localizedDescription);
    }
    
    _persistentStore = nil;
    
    [_rootContext reset];
    
    if (!usesMemoryContext) {
        
        NSURL *storeURL = [self storeURL];
        
        bool exists = [[NSFileManager defaultManager] fileExistsAtPath:storeURL.path];
        
        if (exists) {
            NSError *fileRemoveError = nil;
            
            bool success = [[NSFileManager defaultManager] removeItemAtURL:storeURL error:&fileRemoveError];
            
            if (!success) {
                NSLog(@"Error removing local store: %@", fileRemoveError.localizedDescription);
            }
        }
    }
    
}

- (NSURL *)storeURL {
    NSString                        *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:CFBundleName];
    NSURL                           *storeURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@.sqlite", [self documentsDirectory], appName]];
    
    return storeURL;
}

- (NSString *)documentsDirectory {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

@end
