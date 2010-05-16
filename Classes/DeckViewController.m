//
//  DeckViewController.m
//  UrzasFactory
//
//  Created by Jeremy Lyman on 5/3/10.
//  Copyright 2010 Jeremy Lyman. All rights reserved.
//

#import "DeckViewController.h"
#import "DataController.h"
#import "UrzasFactoryAppDelegate.h"
#import "Deck.h"
#import "Card.h"


@implementation DeckViewController

@synthesize deck;

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
	
	// Load Deck Information

	
	// Load view for content within scrollView
	UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0,0,320,1248)];
	contentView.backgroundColor = [UIColor clearColor];
	
	//********* Add content to view ***********/
	
	CGRect lastImageFrame;
	CGSize textConstraint = CGSizeMake(220.0, 500.0);
	UIFont *textFont = [UIFont fontWithName:@"Trebuchet MS" size:24];
	
	// Deck Name //

	NSString *deckName = deck.name;
	CGSize textSize = [deckName sizeWithFont:textFont constrainedToSize:textConstraint lineBreakMode:UILineBreakModeWordWrap];
	
	UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 65, textSize.width, textSize.height)];
	[nameLabel setBackgroundColor:[UIColor clearColor]];
	[nameLabel setNumberOfLines:0];
	[nameLabel setFont:textFont];
	[nameLabel setTextAlignment:UITextAlignmentCenter];
	[nameLabel setText:deckName];
	
	
	NSLog(@"Label XY: %f,%f", nameLabel.frame.origin.x, nameLabel.frame.origin.y);
	NSLog(@"Label size: %f,%f", nameLabel.frame.size.width, nameLabel.frame.size.height);
	
	UIImage *contentImage = [[UIImage imageNamed:@"contentBoard.png"] stretchableImageWithLeftCapWidth:0 topCapHeight:80];
	UIImageView *contentImageView = [[UIImageView alloc] initWithImage:contentImage]; 
	contentImageView.frame = CGRectMake((320.0 - contentImage.size.width)/2.0, 
										0, 
										contentImage.size.width, 
										contentImage.size.height + textSize.height - 20);
	
	NSLog(@"CIV XY: %f,%f", contentImageView.frame.origin.x, contentImageView.frame.origin.y);
	NSLog(@"CIV size: %f,%f", contentImageView.frame.size.width, contentImageView.frame.size.height);
	
	[contentImageView addSubview:nameLabel];
	[nameLabel release];
	
	lastImageFrame = [contentImageView frame];
	
	[contentView addSubview:contentImageView];
	[contentImageView release];
	
	// Deck Desc //
	textFont = [UIFont fontWithName:@"Trebuchet MS" size:18];	
	NSString *descName = deck.text;
	textSize = [descName sizeWithFont:textFont constrainedToSize:textConstraint lineBreakMode:UILineBreakModeWordWrap];
	
	UILabel *descLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 65, textSize.width, textSize.height)];
	[descLabel setBackgroundColor:[UIColor clearColor]];
	[descLabel	setNumberOfLines:0];
	[descLabel setFont:textFont];
	[descLabel setText:descName];
	
	NSLog(@"Label XY: %f,%f", descLabel.frame.origin.x, descLabel.frame.origin.y);
	NSLog(@"Label size: %f,%f", descLabel.frame.size.width, descLabel.frame.size.height);
	
	contentImage = [[UIImage imageNamed:@"contentBoard.png"] stretchableImageWithLeftCapWidth:0 topCapHeight:80];
	contentImageView = [[UIImageView alloc] initWithImage:contentImage];
	contentImageView.frame = CGRectMake((320.0 - contentImage.size.width)/2.0, 
										lastImageFrame.size.height + lastImageFrame.origin.y, 
										contentImage.size.width, 
										contentImage.size.height + textSize.height);
	
	NSLog(@"CIV XY: %f,%f", contentImageView.frame.origin.x, contentImageView.frame.origin.y);
	NSLog(@"CIV size: %f,%f", contentImageView.frame.size.width, contentImageView.frame.size.height);
	
	[contentImageView addSubview:descLabel];
	[descLabel release];
	
	lastImageFrame = [contentImageView frame];
	
	[contentView addSubview:contentImageView];
	[contentImageView release];
	
	
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
