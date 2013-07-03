HSCoreDataTools
===============

A set of objects to make Core Data EASY!!!

## HSRootCoreDataStack

This is a class that has a single exposed property `-rootContext`. this method will return a NSManagedObjectContext that has been completely initialized and ready to use.

## NSManagedObjectContext+EasyTools.h/m

This category has a couple of methods to make things simpler

`-saveToRootContext` -- will traverse the parent->child contexts up to the root and call `-save` on them all.

`-rootContext` -- returns the top most managedObjectContext.

`contextName` -- is a property that allows you to assign strings to a context, this is very helpful for debugging in multiple contexts.

