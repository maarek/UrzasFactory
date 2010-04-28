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


@interface LibraryPortraitViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	DataController *dataController;
	UISearchBar *sBar;//search bar
	
    BOOL isShowingLandscapeView;
    LibraryLandscapeViewController *landscapeViewController;
}

@property (nonatomic, retain) DataController *dataController;
@property (nonatomic, retain) IBOutlet UISearchBar *sBar;
@property (nonatomic, retain) LibraryLandscapeViewController *landscapeViewController;

- (void)filterAction:(id)sender;


@end