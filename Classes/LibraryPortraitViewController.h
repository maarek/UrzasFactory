//
//  LibraryPortraitViewController.h
//  UrzasFactory
//
//  Created by Jeremy Lyman on 4/26/10.
//  Copyright 2010 Jeremy Lyman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilterViewController.h"

@class LibraryLandscapeViewController;
@class DataController;


@interface LibraryPortraitViewController : UIViewController <UITableViewDelegate,
															UIScrollViewDelegate,
															UITableViewDataSource, 
															NSFetchedResultsControllerDelegate, 
															FilterViewControllerDelegate> {
	UITableView *tView;
	UISearchBar *sBar;//search bar
	NSFetchRequest *fetchRequest;
	int fetchOffset;
	CGPoint tableOffset;
	CGSize tableSize;
	
																
    BOOL isShowingLandscapeView;
    LibraryLandscapeViewController *landscapeViewController;
	
	
	NSFetchedResultsController *_fetchedResultsController;
	NSMutableDictionary *predicateDictionary; // Holds the predicate strings

}

@property (nonatomic, retain) IBOutlet UITableView *tView;
@property (nonatomic, retain) IBOutlet UISearchBar *sBar;
@property (nonatomic, retain) NSFetchRequest *fetchRequest;
@property (nonatomic, retain) LibraryLandscapeViewController *landscapeViewController;
@property (nonatomic, readonly) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSMutableDictionary *predicateDictionary;

- (void)filterAction:(id)sender;
- (void)refreshTableData;


@end