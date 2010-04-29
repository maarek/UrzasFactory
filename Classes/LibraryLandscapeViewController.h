//
//  LibraryLandscapeViewController.h
//  UrzasFactory
//
//  Created by Jeremy Lyman on 4/26/10.
//  Copyright 2010 Jeremy Lyman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFOpenFlowView.h"


@interface LibraryLandscapeViewController : UIViewController <AFOpenFlowViewDataSource, AFOpenFlowViewDelegate> {
	NSArray *coverImageData;
	NSInteger keyListIndex;
	NSOperationQueue *loadImagesOperationQueue;
}

- (void)imageDidLoad:(NSArray *)arguments;
- (IBAction)infoButtonPressed:(id)sender;

@end
