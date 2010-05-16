//
//  FilterViewController.m
//  UrzasFactory
//
//  Created by Jeremy Lyman on 5/12/10.
//  Copyright 2010 Jeremy Lyman. All rights reserved.
//

#import "FilterViewController.h"


@implementation FilterViewController

@synthesize delegate;
@synthesize forestButton;
@synthesize islandButton;
@synthesize mountainButton;
@synthesize plainsButton;
@synthesize swampButton;
@synthesize landButton;
@synthesize predicateDictionary;
@synthesize buttonDictionary;
@synthesize buttonStateDictionary;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backdropBottom.png"]];
	self.title = @"Filter";

	UIBarButtonItem *libraryButton = [[[UIBarButtonItem alloc] initWithTitle:@"Done" 
																	   style:UIBarButtonItemStyleBordered 
																	  target:self.delegate
																	  action:@selector(modalDialogFinished:)] autorelease];
	self.navigationItem.leftBarButtonItem = libraryButton;

}

-(void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];

	// Initial list of buttons and their mode
	
	predicateDictionary = [[NSDictionary dictionaryWithObjectsAndKeys: 
							 @"manaItems.mana.name", forestButton.currentTitle, 
							 @"manaItems.mana.name", islandButton.currentTitle,
							 @"manaItems.mana.name", mountainButton.currentTitle,
							 @"manaItems.mana.name", plainsButton.currentTitle,
							 @"manaItems.mana.name", swampButton.currentTitle, 
							 @"typeString.name", landButton.currentTitle, nil] retain];
	
	buttonDictionary = [[NSMutableDictionary dictionaryWithObjectsAndKeys: 
						forestButton, forestButton.currentTitle, 
						islandButton, islandButton.currentTitle,
						mountainButton, mountainButton.currentTitle,
						plainsButton, plainsButton.currentTitle,
						swampButton, swampButton.currentTitle, 
						landButton, landButton.currentTitle, nil] retain];
	
	buttonStateDictionary = [[NSMutableDictionary dictionaryWithDictionary:predicateDictionary] retain];
	
	NSLog(@"buttonStateDictionary %@", buttonStateDictionary);
}

- (IBAction) buttonPressed:(id)sender {
	[((UIButton*)sender) setSelected:![((UIButton*)sender) isSelected]];

	NSString *key = ((UIButton*)sender).currentTitle;
	
	if ([((UIButton*)sender) isSelected])
		[buttonStateDictionary setObject:[predicateDictionary objectForKey:key] forKey:key];
	else 
		[buttonStateDictionary removeObjectForKey:key];

	NSLog(@"buttonStateDictionary %@", buttonStateDictionary);
	
	[self.delegate updatePredicateDictionary:buttonStateDictionary];
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
	[buttonDictionary release];
	[buttonStateDictionary release];
	[forestButton release];
	[islandButton release];
	[mountainButton release];
	[plainsButton release];
	[swampButton release];
	[landButton release];
	
    [super dealloc];
}


@end
