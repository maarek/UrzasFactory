//
//  LibraryLandscapeViewController.m
//  UrzasFactory
//
//  Created by Jeremy Lyman on 4/26/10.
//  Copyright 2010 Jeremy Lyman. All rights reserved.
//

#import "LibraryLandscapeViewController.h"
#import "UIImageExtras.h"
#import "AFGetImageOperation.h"


@implementation LibraryLandscapeViewController


// the designated initializer. Override to perform setup that is required before the view is loaded.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		
        self.wantsFullScreenLayout = YES; // we want to overlap the status bar.
		
        // when presented, we want to display using a cross dissolve
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    }
	
    return self;	
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

	keyListIndex = 1;
	loadImagesOperationQueue = [[NSOperationQueue alloc] init];
	[(AFOpenFlowView *)self.view setNumberOfImages:9];
}

- (IBAction)infoButtonPressed:(id)sender {
	NSString *alertString;

	alertString = @"Sample images included in this project are all in the public domain, courtesy of NASA.";
	UIAlertView *infoAlertPanel = [[UIAlertView alloc] initWithTitle:@"OpenFlow Demo App" 
															 message:[NSString stringWithFormat:@"%@\n\nFor more info about the OpenFlow API, visit apparentlogic.com.", alertString]
															delegate:nil 
												   cancelButtonTitle:nil 
												   otherButtonTitles:@"Dismiss", nil];
	[infoAlertPanel show];
	[infoAlertPanel release];
}

- (void)imageDidLoad:(NSArray *)arguments {
	UIImage *loadedImage = (UIImage *)[arguments objectAtIndex:0];
	NSNumber *imageIndex = (NSNumber *)[arguments objectAtIndex:1];
	
	// Only resize our images if they are coming from Flickr (samples are already scaled).
	// Resize the image on the main thread (UIKit is not thread safe).
	//if (interestingnessRequest)
	//	loadedImage = [loadedImage cropCenterAndScaleImageToSize:CGSizeMake(225, 225)];
	
	[(AFOpenFlowView *)self.view setImage:loadedImage forIndex:[imageIndex intValue]];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

- (UIImage *)defaultImage {
	return [UIImage imageNamed:@"default.png"];
}

- (void)openFlowView:(AFOpenFlowView *)openFlowView requestImageForIndex:(int)index {
	AFGetImageOperation *getImageOperation = [[AFGetImageOperation alloc] initWithIndex:index viewController:self];
	
	// Test our image input
	//NSURL *photoURL = [NSURL URLWithString:@"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=205401&type=card"]
	NSURL *photoURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=%d&type=card",index]];
	//keyListIndex++;
	getImageOperation.imageURL = photoURL;
	
	[loadImagesOperationQueue addOperation:getImageOperation];
	[getImageOperation release];
}

- (void)openFlowView:(AFOpenFlowView *)openFlowView selectionDidChange:(int)index {
	NSLog(@"Cover Flow selection did change to %d", index);
}

- (void)dealloc {
	[loadImagesOperationQueue release];
    [super dealloc];
}

@end