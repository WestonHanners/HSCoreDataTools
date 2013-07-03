//
//  NSManagedObjectContext+EasyTools.m
//  Easy Core Data Tools
//
//  Created by Weston Hanners on 6/27/13.
//  Copyright (c) 2013 Hanners Software. All rights reserved.
//

#import "NSManagedObjectContext+EasyTools.h""
#import <objc/runtime.h>

static char contextNameKey;

@implementation NSManagedObjectContext (EasyTools)


- (void)setContextName:(NSString *)contextName {
    objc_setAssociatedObject(self, &contextNameKey, contextName, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)contextName {
    return objc_getAssociatedObject(self, &contextNameKey);

}

- (void)saveToRootContext {

    NSManagedObjectContext *currentContext = self;

    while (currentContext.parentContext) {
        
        if (currentContext.hasChanges) {
            
            [currentContext performBlock:^{
                [currentContext save:nil];
                NSLog(@"Saved %@", currentContext);
            }];
        }
        currentContext = currentContext.parentContext;
    }    
}

- (NSManagedObjectContext *)rootContext {

    NSManagedObjectContext *currentContext = self;

    while (currentContext.parentContext) {
        currentContext = currentContext.parentContext;
    }

    return currentContext;
}

@end
