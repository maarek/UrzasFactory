//
//  Mana.h
//  UrzasFactory
//
//  Created by Cameron Knight on 4/28/10.
//  Copyright 2010 Moblico. All rights reserved.
//

#import <CoreData/CoreData.h>

@class Card;

@interface Mana :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet* cards;

@end


@interface Mana (CoreDataGeneratedAccessors)
- (void)addCardsObject:(Card *)value;
- (void)removeCardsObject:(Card *)value;
- (void)addCards:(NSSet *)value;
- (void)removeCards:(NSSet *)value;

@end

