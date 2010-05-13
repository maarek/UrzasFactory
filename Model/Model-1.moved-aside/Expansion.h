//
//  Expansion.h
//  UrzasFactory
//
//  Created by Cameron Knight on 4/28/10.
//  Copyright 2010 Moblico. All rights reserved.
//

#import <CoreData/CoreData.h>

@class Card;

@interface Expansion :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * abbreviation;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet* card;

@end


@interface Expansion (CoreDataGeneratedAccessors)
- (void)addCardObject:(Card *)value;
- (void)removeCardObject:(Card *)value;
- (void)addCard:(NSSet *)value;
- (void)removeCard:(NSSet *)value;

@end

