//
//  Card.h
//  UrzasFactory
//
//  Created by Cameron Knight on 4/28/10.
//  Copyright 2010 Moblico. All rights reserved.
//

#import <CoreData/CoreData.h>

@class Artist;
@class Deck;
@class Expansion;
@class Mana;
@class Type;

@interface Card :  NSManagedObject  
{
}

@property (nonatomic, retain) NSData * flavor;
@property (nonatomic, retain) NSNumber * power;
@property (nonatomic, retain) NSNumber * multiverseID;
@property (nonatomic, retain) NSNumber * convertedManaCost;
@property (nonatomic, retain) NSData * text;
@property (nonatomic, retain) NSNumber * toughness;
@property (nonatomic, retain) NSNumber * loyalty;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * rarity;
@property (nonatomic, retain) NSSet* otherSets;
@property (nonatomic, retain) NSSet* manas;
@property (nonatomic, retain) NSSet* decks;
@property (nonatomic, retain) Type * type;
@property (nonatomic, retain) Expansion * expansion;
@property (nonatomic, retain) Artist * artist;

@end


@interface Card (CoreDataGeneratedAccessors)
- (void)addOtherSetsObject:(Card *)value;
- (void)removeOtherSetsObject:(Card *)value;
- (void)addOtherSets:(NSSet *)value;
- (void)removeOtherSets:(NSSet *)value;

- (void)addManasObject:(Mana *)value;
- (void)removeManasObject:(Mana *)value;
- (void)addManas:(NSSet *)value;
- (void)removeManas:(NSSet *)value;

- (void)addDecksObject:(Deck *)value;
- (void)removeDecksObject:(Deck *)value;
- (void)addDecks:(NSSet *)value;
- (void)removeDecks:(NSSet *)value;

@end

