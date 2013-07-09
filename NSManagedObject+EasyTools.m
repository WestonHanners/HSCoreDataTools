//
//  NSManagedObject+EasyTools.m
//  Portfolio
//
//  Created by Weston Hanners on 7/9/13.
//  Copyright (c) 2013 Cook Medical. All rights reserved.
//

#import "NSManagedObject+EasyTools.h"

@implementation NSManagedObject (EasyTools)

+ (NSArray *)fetchWithPredicate:(NSPredicate *)predicate sortedBy:(NSString *)sortKey ascending:(BOOL)ascending inContext:(NSManagedObjectContext *)context {

    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:sortKey ascending:ascending];

    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass(self)];

    [fetchRequest setSortDescriptors:@[descriptor]];
    [fetchRequest setPredicate:predicate];

    return [context executeFetchRequest:fetchRequest error:nil];

}

@end
