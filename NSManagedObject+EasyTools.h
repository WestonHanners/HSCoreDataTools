//
//  NSManagedObject+EasyTools.h
//  Portfolio
//
//  Created by Weston Hanners on 7/9/13.
//  Copyright (c) 2013 Hanners Software. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (EasyTools)

+ (NSArray *)fetchWithPredicate:(NSPredicate *)predicate sortedBy:(NSString *)sortKey ascending:(BOOL)ascending inContext:(NSManagedObjectContext *)context;

+ (NSArray *)fetchWithPredicate:(NSPredicate *)predicate sortedBy:(NSString *)sortKey ascending:(BOOL)ascending inContext:(NSManagedObjectContext *)context error:(NSError **)error;

+ (NSArray *)fetchAllInContext:(NSManagedObjectContext *)context;

+ (NSArray *)fetchAllInContext:(NSManagedObjectContext *)context error:(NSError **)error;

@end
