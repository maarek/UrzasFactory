//
//  DataController.m
//  UrzasFactory
//
//  Created by Jeremy Lyman on 4/27/10.
//  Copyright 2010 Jeremy Lyman. All rights reserved.
//

#import "DataController.h"


@implementation DataController

@synthesize list;


- (id)init {
	if (self = [super init]) {
		//Instantiate list
		NSMutableArray *localList = [[NSMutableArray alloc] init];
		self.list = localList;
		[localList release];
		
		//Add initial Data
		[self addData:@"Item 1"];
		[self addData:@"Item 2"];
	}
	return self;
}

- (void)dealloc {
	[list release];
	[super dealloc];
}

- (unsigned)countOfList {
	return [list count];
}

- (id)objectInListAtIndex:(unsigned)theIndex {
	return [list objectAtIndex:theIndex];
}

- (void)removeDataAtIndex:(unsigned)theIndex {
	[list removeObjectAtIndex:theIndex];
}

- (void)addData:(NSString*)data {
	[list addObject:data];
}

// Custom set accessor to ensure the new list is mutable
- (void)setList:(NSMutableArray *)newList {
	if (list != newList) {
		[list release];
		list = [newList mutableCopy];
	}
}   

@end
