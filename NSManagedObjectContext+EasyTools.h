//
//  NSManagedObjectContext+EasyTools.h
//  Easy Core Data Tools
//
//  Created by Weston Hanners on 6/27/13.
//  Copyright (c) 2013 Hanners Software. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (EasyTools)

- (void)saveToRootContext;

- (NSManagedObjectContext *)rootContext;

@property (strong, nonatomic) NSString *contextName;


@end
