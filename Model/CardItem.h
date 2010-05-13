//
//  CardItem.h
//  UrzasFactory
//
//  Created by Cameron Knight on 5/12/10.
//  Copyright 2010 Moblico. All rights reserved.
//

#import <CoreData/CoreData.h>

@class Card;
@class Deck;

@interface CardItem :  NSManagedObject  
{
}

@property (nonatomic, retain) NSNumber * quantity;
@property (nonatomic, retain) NSNumber * sideboard;
@property (nonatomic, retain) Card * card;
@property (nonatomic, retain) Deck * deck;

@end



