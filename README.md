HSCoreDataTools
===============

A set of objects to make Core Data EASY!!!

This project doesn't aim to manage you contexts for you, you will still have to keep your contexts around. If you want something a bit more automatic, check out [MagicalRecord](https://github.com/magicalpanda/MagicalRecord) by Saul Mora (Magical Panda)

###Features

- Instant Core Data Stack - No longer do you have to pollute your AppDelegate with boilerplate. One class manages it all

- Auto-Migrating data stores - Just make sure you are versioning and this stack will auto-migrate for you.

- Save to RootContex - Not sure how deep you are in your context tree, this method will save to the root for you.

- Context Naming - This really helps when debugging, all contexts now have a contextName property for you to set/read.

#### HSRootCoreDataStack.h/m

This is a class that has a single exposed property `-(NSManagedObjectContext *)rootContext`. This method will return a NSManagedObjectContext that has been completely initialized and ready to use.

#### NSManagedObjectContext+EasyTools.h/m

This category has a couple of methods to make things simpler

`-(void)saveToRootContext` -- will traverse the parent->child contexts up to the root and call `-save` on them all.

`-(void)rootContext` -- returns the top most managedObjectContext.

`-(NSString *)contextName` -- is a property that allows you to assign strings to a context, this is very helpful for debugging in multiple contexts.

#### NSManagedObject+EasyTools.h/m

This category adds a method to help clear out some fetch request boilerplate

`+(NSArray *)fetchWithPredicate...` -- takes a predicate/sortKey/context and returns an NSArray of all objects that match. This method potentally knocks out 4 lines of code per fetch.

