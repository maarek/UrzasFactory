//
//  DeckViewController.m
//  UrzasFactory
//
//  Created by Jeremy Lyman on 5/3/10.
//  Copyright 2010 Jeremy Lyman. All rights reserved.
//

#import "DeckViewController.h"


@implementation DeckViewController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/


- (void)viewDidLoad {
	[super viewDidLoad];
	
	
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backdropBottom.png"]];
	

	CGRect fullScreenRect = CGRectMake(0,0,320,416);
	UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:fullScreenRect];
	scrollView.contentSize = CGSizeMake(320,1248);

	
	// Load view for content within scrollView
	UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0,0,320,1248)];
	contentView.backgroundColor = [UIColor clearColor];
	
	UIImageView *contentImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"deckContent.png"]];
	[contentView addSubview:contentImage];
	[contentImage release];
	
	//********* Add content to view ***********/
	NSString *deckName = [NSString stringWithString:@"~Deck Name~"];
	UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(52, 70, 300, 30)];
	[nameLabel setBackgroundColor:[UIColor clearColor]];
	[nameLabel setFont:[UIFont fontWithName:@"Trebuchet MS" size:24]];
	[nameLabel setText:deckName];
	[contentView addSubview:nameLabel];
	[nameLabel release];
	
	NSString *descName = [NSString stringWithString:@"~Deck Desc~"];
	UILabel *descLabel = [[UILabel alloc] initWithFrame:CGRectMake(52, 225, 300, 30)];
	[descLabel setBackgroundColor:[UIColor clearColor]];
	[descLabel setFont:[UIFont fontWithName:@"Trebuchet MS" size:16]];
	[descLabel setText:descName];
	[contentView addSubview:descLabel];
	[descLabel release];
	
	// Main Deck Cards
	
	// SideBoard Cards
	
	// Statistics?
	
	
	/************* END CONTENT ****************/
	
	// Add the contentView
	[scrollView addSubview:contentView];
	[contentView release];
	
	// Add scrollView
	[self.view addSubview:scrollView];
	[scrollView release];
	
	
	// Display navigation bar for this view controller
	
	self.title = @"Deck";
}

-(void)viewWillAppear:(BOOL)animated {
	[self.navigationController setNavigationBarHidden:NO animated:animated];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
