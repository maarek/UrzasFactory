//
//  UrzasFactoryAppDelegate.m
//  UrzasFactory
//
//  Created by Jeremy Lyman on 2/20/10.
//  Copyright Lost Creatures 2010. All rights reserved.
//

#import "UrzasFactoryAppDelegate.h"
#import "MainViewController.h"
#import "CreditsViewController.h"
@implementation UrzasFactoryAppDelegate

@synthesize window, navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque];
    // Override point for customization after app launch    
//	MainViewController * viewController = [[MainViewController alloc] initWithNibName:@"MainView" bundle:nil];
	self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0];
	self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
	[window addSubview:navigationController.view];
	[window makeKeyAndVisible];
}

/**
 applicationWillTerminate: saves changes in the application's managed object context before the application terminates.
 */
- (void)applicationWillTerminate:(UIApplication *)application {
	
    NSError *error = nil;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
			/*
			 Replace this implementation with code to handle the error appropriately.
			 
			 abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
			 */
			NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
			abort();
        } 
    }
}


#pragma mark -
#pragma mark Core Data stack

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *) managedObjectContext {
	
    if (managedObjectContext != nil) {
        return managedObjectContext;
    }
	
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        managedObjectContext = [[NSManagedObjectContext alloc] init];
        [managedObjectContext setPersistentStoreCoordinator: coordinator];
    }
    return managedObjectContext;
}


/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created by merging all of the models found in the application bundle.
 */
- (NSManagedObjectModel *)managedObjectModel {
	
    if (managedObjectModel != nil) {
        return managedObjectModel;
    }
    managedObjectModel = [[NSManagedObjectModel mergedModelFromBundles:nil] retain];    
    return managedObjectModel;
}


/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
	
    if (persistentStoreCoordinator != nil) {
        return persistentStoreCoordinator;
    }

	NSString * localStorePath = [[self applicationDocumentsDirectory] stringByAppendingPathComponent: @"UrzasFactory.sqlite"];
	NSString * defaultStorePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: @"UrzasFactory.sqlite"];

	if (![[NSFileManager defaultManager] fileExistsAtPath:localStorePath]) {
		NSError * err = nil;
		[[NSFileManager defaultManager] copyItemAtPath:defaultStorePath
												toPath:localStorePath
												 error:&err];
		if (err) {
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error Createing Database"
															message:[NSString stringWithFormat:@"Error was: %@, library will be readonly.", [err localizedDescription]]
														   delegate:self 
												  cancelButtonTitle:@"OK"
												  otherButtonTitles:nil];
			[alert show];
			localStorePath = defaultStorePath;
		}
	}
	NSURL *storeUrl = [NSURL fileURLWithPath:localStorePath];

	NSError *error = nil;
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]) {
		/*
		 Replace this implementation with code to handle the error appropriately.
		 
		 abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
		 
		 Typical reasons for an error here include:
		 * The persistent store is not accessible
		 * The schema for the persistent store is incompatible with current managed object model
		 Check the error message to determine what the actual problem was.
		 */
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		abort();
    }    
	
    return persistentStoreCoordinator;
}


#pragma mark -
#pragma mark Application's Documents directory

/**
 Returns the path to the application's Documents directory.
 */
- (NSString *)applicationDocumentsDirectory {
	return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	
    [managedObjectContext release];
    [managedObjectModel release];
    [persistentStoreCoordinator release];
    
	[window release];
	[super dealloc];
}


@end

