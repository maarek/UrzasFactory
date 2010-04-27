//
//  LibraryPortraitViewController.h
//  UrzasFactory
//
//  Created by Jeremy Lyman on 4/26/10.
//  Copyright 2010 Jeremy Lyman. All rights reserved.
//

#import <UIKit/UIKit.h>



@class LibraryLandscapeViewController;



@interface LibraryPortraitViewController : UIViewController {
    BOOL isShowingLandscapeView;
    LibraryLandscapeViewController *landscapeViewController;
}

@property (nonatomic, retain) LibraryLandscapeViewController *landscapeViewController;

- (void)filterAction:(id)sender;


@end