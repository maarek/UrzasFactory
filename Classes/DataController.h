//
//  DataController.h
//  UrzasFactory
//
//  Created by Jeremy Lyman on 4/27/10.
//  Copyright 2010 Jeremy Lyman. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DCTooManyEntitiesReturnedException @"Too many entities returned"
#define DCCoreDataExeption @"Core Data exception"

@interface DataController : NSObject {
}



+(NSArray *)objectsForEntityNamed:(NSString *)name
						inContext:(NSManagedObjectContext *)context;


// Strict predicate search
+(NSArray *)objectsForEntityNamed:(NSString *)name 
					  matchingKey:(NSString *)key
						 andValue:(id)value 
						inContext:(NSManagedObjectContext *)context;

+(NSManagedObject *)objectForEntityNamed:(NSString *)name 
							 matchingKey:(NSString *)key andValue:(id)value 
							   inContext:(NSManagedObjectContext *)context;

+(NSArray *)objectsForEntityNamed:(NSString *)name
			matchingKeysAndValues:(NSDictionary *)keyValues 
						  usingOR:(BOOL)useOR
						inContext:(NSManagedObjectContext *)context;

// Loose predicate search
+(NSArray *) objectsForEntityNamed:(NSString *)name 
					   matchingKey:(NSString *)key 
				   containingValue:(id)value 
						 inContext:(NSManagedObjectContext *)context;

+(NSArray *)objectsForEntityNamed:(NSString *)name
			containingKeysAndValues:(NSDictionary *)keyValues 
						  usingOR:(BOOL)useOR
						inContext:(NSManagedObjectContext *)context;





@end
