//
//  CardViewController.h
//  UrzasFactory
//
//  Created by Cameron Knight on 4/28/10.
//  Copyright 2010 Moblico. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UFTableViewController.h"

@class Card;

@interface CardViewController : UFTableViewController {
	Card * card;
	NSMutableDictionary * fields;
}

@property (nonatomic, retain) Card * card;
@property (nonatomic, retain) NSMutableDictionary * fields;

@end
