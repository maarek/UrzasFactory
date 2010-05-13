//
//  Deck.h
//  UrzasFactory
//
//  Created by Cameron Knight on 5/12/10.
//  Copyright 2010 Moblico. All rights reserved.
//

#import <CoreData/CoreData.h>

@class CardItem;

@interface Deck :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSSet* cards;

@end


@interface Deck (CoreDataGeneratedAccessors)
- (void)addCardsObject:(CardItem *)value;
- (void)removeCardsObject:(CardItem *)value;
- (void)addCards:(NSSet *)value;
- (void)removeCards:(NSSet *)value;

@end

