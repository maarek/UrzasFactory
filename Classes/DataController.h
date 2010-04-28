//
//  DataController.h
//  UrzasFactory
//
//  Created by Jeremy Lyman on 4/27/10.
//  Copyright 2010 Jeremy Lyman. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DataController : NSObject {
	NSMutableArray *list;
}

@property (nonatomic, copy, readwrite) NSMutableArray *list;

- (unsigned)countOfList; //returns number of elements in list
- (id)objectInListAtIndex:(unsigned)theIndex; //returns object at given index
- (void)addData:(NSString*)data; //adds data to the list
- (void)removeDataAtIndex:(unsigned)theIndex;

@end
