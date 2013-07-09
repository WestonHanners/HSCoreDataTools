//
//  NSManagedObject+EasyTools.h
//  Portfolio
//
//  Created by Weston Hanners on 7/9/13.
//  Copyright (c) 2013 Cook Medical. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (EasyTools)

+ (NSArray *)fetchWithPredicate:(NSPredicate *)predicate sortedBy:(NSString *)sortKey ascending:(BOOL)ascending inContext:(NSManagedObjectContext *)context;

@end
