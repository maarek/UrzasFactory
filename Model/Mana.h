//
//  Mana.h
//  UrzasFactory
//
//  Created by Cameron Knight on 5/12/10.
//  Copyright 2010 Moblico. All rights reserved.
//

#import <CoreData/CoreData.h>

@class Card;
@class ManaItem;

@interface Mana :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet* cards;
@property (nonatomic, retain) NSSet* manaItems;

@end


@interface Mana (CoreDataGeneratedAccessors)
- (void)addCardsObject:(Card *)value;
- (void)removeCardsObject:(Card *)value;
- (void)addCards:(NSSet *)value;
- (void)removeCards:(NSSet *)value;

- (void)addManaItemsObject:(ManaItem *)value;
- (void)removeManaItemsObject:(ManaItem *)value;
- (void)addManaItems:(NSSet *)value;
- (void)removeManaItems:(NSSet *)value;

@end

