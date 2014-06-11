Easy Core Data Tools
===============

A set of objects to make Core Data EASY!!!

This project doesn't aim to manage your contexts for you, you will still have to keep your contexts around. If you want something a bit more automatic, check out [MagicalRecord](https://github.com/magicalpanda/MagicalRecord) by Saul Mora (Magical Panda).

The main focus is super-fast, lightweight, almost snippet-like CoreData stack implementation.

##Features

- Instant Core Data Stack - No longer do you have to pollute your AppDelegate with boilerplate. One class manages it all

- Unit-Testing Stack - Preconfigured stack in-memory, sutible for using in unit tests.

- Auto-Migrating data stores - Just make sure you are versioning and this stack will auto-migrate for you.

- Save to RootContex - Not sure how deep you are in your context tree, this method will save to the root for you.

- Context Naming - This really helps when debugging, all contexts now have a contextName property for you to set/read. (This will be deprecated once iOS8 is released.)


### HSRootCoreDataStack

`-(NSManagedObjectContext *)rootContext` -- This method will return a NSManagedObjectContext that has been completely initialized and ready to use.

`-(NSManagedObjectContext *)unitTestingContext` -- This method will return an in-memory core data store.

UPDATE: I also exposed the PersistentStoreCoordinator, PersistentStore, and ManagedObjectModel. There are legitimate reasons for needing to access these, and I wanted to make it easy.


### NSManagedObjectContext+EasyTools

This category has a couple of methods to make things simpler

`-(void)saveToRootContext` -- will traverse the parent->child contexts up to the root and call `-save` on them all.

`-(void)rootContext` -- returns the top most managedObjectContext.

`-(NSString *)contextName` -- is a property that allows you to assign strings to a context, this is very helpful for debugging in multiple contexts.

`+(NSManagedObjectContext *)appRootContext` -- allows you to access appDelegate.rootContext from any part of your app.

### NSManagedObject+EasyTools

This category adds a method to help clear out some fetch request boilerplate

`+(NSArray *)fetchWithPredicate...` -- takes a predicate/sortKey/context and returns an NSArray of all objects that match. This method potentally knocks out 4 lines of code per fetch.

