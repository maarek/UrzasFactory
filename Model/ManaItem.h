//
//  ManaItem.h
//  UrzasFactory
//
//  Created by Cameron Knight on 5/12/10.
//  Copyright 2010 Moblico. All rights reserved.
//

#import <CoreData/CoreData.h>

@class Card;
@class Mana;

@interface ManaItem :  NSManagedObject  
{
}

@property (nonatomic, retain) NSNumber * quantity;
@property (nonatomic, retain) Card * card;
@property (nonatomic, retain) Mana * mana;

@end



