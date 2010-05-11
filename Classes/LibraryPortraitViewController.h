//
//  LibraryPortraitViewController.h
//  UrzasFactory
//
//  Created by Jeremy Lyman on 4/26/10.
//  Copyright 2010 Jeremy Lyman. All rights reserved.
//

#import <UIKit/UIKit.h>



@class LibraryLandscapeViewController;
@class DataController;


@interface LibraryPortraitViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate> {
	UISearchBar *sBar;//search bar
	
    BOOL isShowingLandscapeView;
    LibraryLandscapeViewController *landscapeViewController;
	
	NSFetchedResultsController *_fetchedResultsController;

}

@property (nonatomic, retain) IBOutlet UISearchBar *sBar;
@property (nonatomic, retain) LibraryLandscapeViewController *landscapeViewController;
@property (nonatomic, readonly) NSFetchedResultsController *fetchedResultsController;

- (void)filterAction:(id)sender;


@end