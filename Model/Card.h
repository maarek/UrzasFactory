//
//  Card.h
//  UrzasFactory
//
//  Created by Cameron Knight on 5/12/10.
//  Copyright 2010 Moblico. All rights reserved.
//

#import <CoreData/CoreData.h>

@class Artist;
@class CardItem;
@class Expansion;
@class Mana;
@class ManaItem;
@class Subtype;
@class Type;

@interface Card :  NSManagedObject  
{
}

@property (nonatomic, retain) NSNumber * multiPart;
@property (nonatomic, retain) NSNumber * convertedManaCost;
@property (nonatomic, retain) NSString * part;
@property (nonatomic, retain) NSString * subtypeString;
@property (nonatomic, retain) NSNumber * loyalty;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * typeString;
@property (nonatomic, retain) NSNumber * number;
@property (nonatomic, retain) NSNumber * multiverseID;
@property (nonatomic, retain) NSNumber * power;
@property (nonatomic, retain) NSNumber * toughness;
@property (nonatomic, retain) NSData * text;
@property (nonatomic, retain) NSString * rarity;
@property (nonatomic, retain) NSData * flavor;
@property (nonatomic, retain) NSSet* decks;
@property (nonatomic, retain) Expansion * expansion;
@property (nonatomic, retain) NSSet* subtypes;
@property (nonatomic, retain) NSSet* types;
@property (nonatomic, retain) NSSet* manaItems;
@property (nonatomic, retain) Artist * artist;
@property (nonatomic, retain) NSSet* otherSets;
@property (nonatomic, retain) NSSet* manas;
@property (nonatomic, retain) Card * otherPart;

@end


@interface Card (CoreDataGeneratedAccessors)
- (void)addDecksObject:(CardItem *)value;
- (void)removeDecksObject:(CardItem *)value;
- (void)addDecks:(NSSet *)value;
- (void)removeDecks:(NSSet *)value;

- (void)addSubtypesObject:(Subtype *)value;
- (void)removeSubtypesObject:(Subtype *)value;
- (void)addSubtypes:(NSSet *)value;
- (void)removeSubtypes:(NSSet *)value;

- (void)addTypesObject:(Type *)value;
- (void)removeTypesObject:(Type *)value;
- (void)addTypes:(NSSet *)value;
- (void)removeTypes:(NSSet *)value;

- (void)addManaItemsObject:(ManaItem *)value;
- (void)removeManaItemsObject:(ManaItem *)value;
- (void)addManaItems:(NSSet *)value;
- (void)removeManaItems:(NSSet *)value;

- (void)addOtherSetsObject:(Card *)value;
- (void)removeOtherSetsObject:(Card *)value;
- (void)addOtherSets:(NSSet *)value;
- (void)removeOtherSets:(NSSet *)value;

- (void)addManasObject:(Mana *)value;
- (void)removeManasObject:(Mana *)value;
- (void)addManas:(NSSet *)value;
- (void)removeManas:(NSSet *)value;

@end

