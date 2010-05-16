//
//  DataController.m
//  UrzasFactory
//
//  Created by Jeremy Lyman on 4/27/10.
//  Copyright 2010 Jeremy Lyman. All rights reserved.
//

#import "DataController.h"


@implementation DataController


- (id)init {
	if (self = [super init]) {
		//
	}
	return self;
}



- (void)dealloc {
	[super dealloc];
}

+(NSArray *)objectsForEntityNamed:(NSString *)name 
						inContext:(NSManagedObjectContext *)context
{
	
	// We have to tell the Fetch Request which entity instances to retrieve. We do
	// that using an NSEntityDescription based on the parameter name.
	NSEntityDescription *entity = [NSEntityDescription 
								   entityForName:name inManagedObjectContext:context];
	
	// Next, we declare an NSFetchRequest, and give it the entity description
	NSFetchRequest *req = [[NSFetchRequest alloc] init];	[req setEntity:entity];
	
	NSError *error = nil;
	
	// We next supply it (by reference) when we execute the request
	NSArray *array = [context executeFetchRequest:req 
											error:&error];
	
	if (array == nil)
	{
		// We instantiate an exception using the error description from
		// NSError, then raise the exception, which stops execution
		NSException *exception = [NSException 
								  exceptionWithName:DCCoreDataExeption 
								  reason:[error localizedDescription] 
								  userInfo:nil];
		
		// Since execution will stop when we raise the exception, we
		// need to release any memory before we do so. 
		[req release];
		[exception raise];
	}
	
	[req release];
	
	return array;
}

+(NSArray *) objectsForEntityNamed:(NSString *)name 
					   matchingKey:(NSString *)key 
						  andValue:(id)value 
						 inContext:(NSManagedObjectContext *)context
{
	// Since NSString and NSPredicate use different format strings,
	// we use a two-step process to create our format string here
	NSString *predString = [NSString stringWithFormat:
							@"%@ == %%@", key];
	NSPredicate *pred = [NSPredicate 
						 predicateWithFormat:predString, value];
	
	NSEntityDescription *entity = [NSEntityDescription 
								   entityForName:name inManagedObjectContext:context];
	
	NSFetchRequest *req = [[NSFetchRequest alloc] init];
	[req setEntity:entity];	
	[req setPredicate:pred];
	
	
	NSError *error = nil;
	NSArray *array = [context executeFetchRequest:req
											error:&error];    
	if (array == nil)
	{
		NSException *exception = [NSException 
								  exceptionWithName:DCCoreDataExeption 
								  reason:[error localizedDescription] 
								  userInfo:nil];
		[exception raise];
	}
	
	[req release];
	return array;
}

+(NSManagedObject *)objectForEntityNamed:(NSString *)name 
							 matchingKey:(NSString *)key 
								andValue:(id)value 
							   inContext:(NSManagedObjectContext *)context
{
	
	NSArray *array = [DataController
					  objectsForEntityNamed:name 
					  matchingKey:key andValue:value inContext:context];
	
	// If there are more than one objects in the array, throw an exception
	if ([array count] > 1)
	{
		NSException *exception = [NSException 
								  exceptionWithName:DCTooManyEntitiesReturnedException 
								  reason:@"Too many instances retrieved for criteria" 
								  userInfo:nil];
		[exception raise];
	}
	
	// If there are no objects, just return nil
	if ([array count] == 0)
		return nil;
	
	// Return the object at index 0
	return (NSManagedObject *)[array objectAtIndex:0];
}

+(NSArray *)objectsForEntityNamed:(NSString *)name 
			matchingKeysAndValues:(NSDictionary *)keyValues 
						  usingOR:(BOOL)useOR 
						inContext:(NSManagedObjectContext *)context
{
	
	NSEnumerator *e = [keyValues keyEnumerator];
	NSPredicate *pred = nil;
    NSString *key;
    
	while (key = [e nextObject]) 
	{
		// Declare a format string for creating the current subpredicate
		NSString *predString = 
		[NSString stringWithFormat:@"%@ == %%@",  key];
		
		// First time through, pred is nil and shouldn't be compounded with anything
		if (pred == nil)
			pred = [NSPredicate predicateWithFormat:predString, 
					[keyValues objectForKey:key]];
		else
		{
			// if pred is not nil, then create a compound based on the new
			// subpredicate tempPred and the existing predicate pred
			
			NSPredicate *tempPred = [NSPredicate 
									 predicateWithFormat:predString, 
									 [keyValues objectForKey:key]];
			NSArray *array = [NSArray arrayWithObjects:tempPred, 
							  pred, nil];
            if (useOR)
				pred = [NSCompoundPredicate orPredicateWithSubpredicates:array];
			else
				pred = [NSCompoundPredicate andPredicateWithSubpredicates:array]; 
		}
	}
	
	NSEntityDescription *entity = [NSEntityDescription 
								   entityForName:name inManagedObjectContext:context];
	NSFetchRequest *req = [[NSFetchRequest alloc] init];
	[req setEntity:entity];	
	[req setPredicate:pred];
	
	
	NSError *error = nil;
	NSArray *array = [context executeFetchRequest:req 
											error:&error];    
	if (array == nil)
	{
		NSException *exception = [NSException 
								  exceptionWithName:DCCoreDataExeption 
								  reason:[error localizedDescription] 
								  userInfo:nil];
		[exception raise];
	}
	
	[req release];
	return array;
}

+(NSArray *) objectsForEntityNamed:(NSString *)name 
					   matchingKey:(NSString *)key 
				   containingValue:(id)value 
						 inContext:(NSManagedObjectContext *)context
{
	// Since NSString and NSPredicate use different format strings,
	// we use a two-step process to create our format string here
	NSString *predString = [NSString stringWithFormat:
							@"ANY %@ LIKE %%@", key];
	NSPredicate *pred = [NSPredicate 
						 predicateWithFormat:predString, value];
	
	NSEntityDescription *entity = [NSEntityDescription 
								   entityForName:name inManagedObjectContext:context];
	
	NSFetchRequest *req = [[NSFetchRequest alloc] init];
	[req setEntity:entity];	
	[req setPredicate:pred];
	
	
	NSError *error = nil;
	NSArray *array = [context executeFetchRequest:req
											error:&error];    
	if (array == nil)
	{
		NSException *exception = [NSException 
								  exceptionWithName:DCCoreDataExeption 
								  reason:[error localizedDescription] 
								  userInfo:nil];
		[exception raise];
	}
	
	[req release];
	return array;
}

+(NSArray *)objectsForEntityNamed:(NSString *)name 
			containingKeysAndValues:(NSDictionary *)keyValues 
						  usingOR:(BOOL)useOR 
						inContext:(NSManagedObjectContext *)context
{

	NSEnumerator *e = [keyValues keyEnumerator];
	NSPredicate *pred = nil;
    NSString *key;
    
	while (key = [e nextObject]) 
	{
		// Declare a format string for creating the current subpredicate
		NSString *predString = [NSString stringWithFormat:@"%@ CONTAINS %%@", [keyValues objectForKey:key]];
		
		// First time through, pred is nil and shouldn't be compounded with anything
		if (pred == nil)
			pred = [NSPredicate predicateWithFormat:predString, 
					key];
		else
		{
			// if pred is not nil, then create a compound based on the new
			// subpredicate tempPred and the existing predicate pred
			
			NSPredicate *tempPred = [NSPredicate 
									 predicateWithFormat:predString, 
									 key];
			NSArray *array = [NSArray arrayWithObjects:tempPred, 
							  pred, nil];
            if (useOR)
				pred = [NSCompoundPredicate orPredicateWithSubpredicates:array];
			else
				pred = [NSCompoundPredicate andPredicateWithSubpredicates:array]; 
		}
	}
	
	NSEntityDescription *entity = [NSEntityDescription 
								   entityForName:name inManagedObjectContext:context];
	NSFetchRequest *req = [[NSFetchRequest alloc] init];
	[req setEntity:entity];	
	[req setPredicate:pred];
	
	
	NSError *error = nil;
	NSArray *array = [context executeFetchRequest:req 
											error:&error];    
	if (array == nil)
	{
		NSException *exception = [NSException 
								  exceptionWithName:DCCoreDataExeption 
								  reason:[error localizedDescription] 
								  userInfo:nil];
		[exception raise];
	}
	
	[req release];
	return array;
}

+(NSFetchRequest *)requestForEntityNamed:(NSString *)name 
				  containingKeyAndValues:(NSDictionary *)keyValues 
								 usingOR:(BOOL)useOR 
					 withSortDescriptors:(NSArray *)sortDescriptorStrings
							   inContext:(NSManagedObjectContext *)context
{
	NSEnumerator *e = [keyValues keyEnumerator];
	NSPredicate *pred = nil;
    NSString *key;
    
	while (key = [e nextObject]) 
	{
		// Declare a format string for creating the current subpredicate
		NSString *predString = [NSString stringWithFormat:@"ANY %@ LIKE %%@", [keyValues objectForKey:key]];
		
		// First time through, pred is nil and shouldn't be compounded with anything
		if (pred == nil)
			pred = [NSPredicate predicateWithFormat:predString, 
					key];
		else
		{
			// if pred is not nil, then create a compound based on the new
			// subpredicate tempPred and the existing predicate pred
			
			NSPredicate *tempPred = [NSPredicate 
									 predicateWithFormat:predString, 
									 key];
			NSArray *array = [NSArray arrayWithObjects:tempPred, 
							  pred, nil];
            if (useOR)
				pred = [NSCompoundPredicate orPredicateWithSubpredicates:array];
			else
				pred = [NSCompoundPredicate andPredicateWithSubpredicates:array]; 
		}
	}
	
	NSEntityDescription *entity = [NSEntityDescription 
								   entityForName:name inManagedObjectContext:context];
	
	NSMutableArray *sortDescriptors = [[NSMutableArray alloc] init];
	NSString *descriptor;
	
	for (descriptor in sortDescriptorStrings) {
		NSSortDescriptor *desc = [[NSSortDescriptor alloc] initWithKey:descriptor ascending:YES];
		[sortDescriptors addObject:desc];
		[desc release];
	}
		
	
	
	NSFetchRequest *req = [[[NSFetchRequest alloc] init] autorelease];
	[req setEntity:entity];	
	[req setPredicate:pred];
	[req setSortDescriptors:sortDescriptors];
	
	[sortDescriptors release];
	return req;
}

+(NSPredicate *)predicateContainingKeyAndValues:(NSDictionary *)keyValues 
										usingOR:(BOOL)useOR {
	NSEnumerator *e = [keyValues keyEnumerator];
	NSPredicate *pred = nil;
    NSString *key;
    
	while (key = [e nextObject]) 
	{
		// Declare a format string for creating the current subpredicate
		NSString *predString = [NSString stringWithFormat:@"ANY %@ LIKE %%@", [keyValues objectForKey:key]];
		
		// First time through, pred is nil and shouldn't be compounded with anything
		if (pred == nil)
			pred = [NSPredicate predicateWithFormat:predString, 
					key];
		else
		{
			// if pred is not nil, then create a compound based on the new
			// subpredicate tempPred and the existing predicate pred
			
			NSPredicate *tempPred = [NSPredicate 
									 predicateWithFormat:predString, 
									 key];
			NSArray *array = [NSArray arrayWithObjects:tempPred, 
							  pred, nil];
            if (useOR)
				pred = [NSCompoundPredicate orPredicateWithSubpredicates:array];
			else
				pred = [NSCompoundPredicate andPredicateWithSubpredicates:array]; 
		}
	}
	
	return pred;
}

@end
