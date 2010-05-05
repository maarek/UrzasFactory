//
//  MainViewController.m
//  UrzasFactory
//
//  Created by Cameron Knight on 2/25/10.
//  Copyright 2010 Moblico. All rights reserved.
//

#import "MainViewController.h"
#import "DecksViewController.h"
#import "DeckViewController.h"
#import "LibraryPortraitViewController.h"
#import "CreditsViewController.h"

@implementation MainViewController

@synthesize decksButton, libraryButton, creditsButton;

- (IBAction)action:(id)sender {
	if (sender == decksButton) {
		//DecksViewController * viewController = [[DecksViewController alloc] init];
		DeckViewController * viewController = [[DeckViewController alloc] init];
		[self.navigationController pushViewController:viewController animated:YES];
		[viewController release];
	} else if (sender == libraryButton) {
		LibraryPortraitViewController * viewController = [[LibraryPortraitViewController alloc] init];
		[self.navigationController pushViewController:viewController animated:YES];
		[viewController	release];
	} else if (sender == creditsButton) {
		CreditsViewController * viewController = [[CreditsViewController alloc] init];
		[self.navigationController pushViewController:viewController animated:YES];
		[viewController	release];
	}
}
/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/
- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self.navigationController setNavigationBarHidden:YES animated:animated];
	
	self.title = @"Main";
}
- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
