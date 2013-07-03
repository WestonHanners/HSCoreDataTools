//
//  HSRootCoreDataStack.h
//  CoreDataTemplate
//
//  Created by Weston Hanners on 6/5/13.
//  Copyright (c) 2013 Hanners Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSRootCoreDataStack : NSObject

@property (strong, nonatomic) NSManagedObjectContext *rootContext;

@end
