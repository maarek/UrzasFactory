//
//  DecksViewController.h
//  UrzasFactory
//
//  Created by Cameron Knight on 2/25/10.
//  Copyright 2010 Moblico. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UFTableViewController.h"


@interface DecksViewController : UFTableViewController <NSFetchedResultsControllerDelegate> {

	NSFetchedResultsController *_fetchedResultsController;
}

@property (nonatomic, readonly) NSFetchedResultsController *fetchedResultsController;

@end
