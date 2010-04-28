//
//  LibraryPortraitViewController.m
//  UrzasFactory
//
//  Created by Jeremy Lyman on 4/26/10.
//  Copyright 2010 Jeremy Lyman. All rights reserved.
//

#import "LibraryPortraitViewController.h"
#import "LibraryLandscapeViewController.h"
#import "UFView.h"
#import "DataController.h"

@implementation LibraryPortraitViewController

@synthesize dataController;
@synthesize sBar;
@synthesize landscapeViewController;

/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:style]) {
    }
    return self;
}
*/


- (void)viewDidLoad {

	
	self.dataController = [[DataController alloc] init];
	
	// create and configure the view
	//UFView * deckView = [[UFView alloc] initWithFrame:self.navigationController.view.frame];
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backdropBottom.png"]];
	
	CGRect cgRct = CGRectMake(10, 10, 300, 400); //define size and position of view
	UITableView * tableView = [[UITableView alloc] initWithFrame:cgRct style:UITableViewStyleGrouped];
	tableView.dataSource = self;
	tableView.delegate = self; //make the current object the event handler for view
	tableView.backgroundColor = [UIColor clearColor];
	
	//self.view = deckView;
	//[deckView release];
	[self.view addSubview:tableView];
	[tableView release];
	
    LibraryLandscapeViewController *viewController = [[LibraryLandscapeViewController alloc]
											   initWithNibName:@"LibraryLandscapeView" bundle:nil];
    self.landscapeViewController = viewController;
    [viewController release];
	
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:)
												 name:UIDeviceOrientationDidChangeNotification object:nil];
	
	
	
	// Display navigation bar for this view controller.
	[self.navigationController setNavigationBarHidden:NO];
	self.title = @"Library";
	UIBarButtonItem *libraryButton = [[[UIBarButtonItem alloc] initWithTitle:@"Filters" 
																   style:UIBarButtonItemStyleBordered 
																  target:self 
																  action:@selector(filterAction:)] autorelease];
	self.navigationItem.rightBarButtonItem = libraryButton;
}


- (void)viewDidUnload {
    self.landscapeViewController = nil;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
    [landscapeViewController release];
    [super dealloc];	
}

- (void)orientationChanged:(NSNotification *)notification {
    // We must add a delay here, otherwise we'll swap in the new view
    // too quickly and we'll get an animation glitch
    [self performSelector:@selector(updateLandscapeView) withObject:nil afterDelay:0];
}

- (void)updateLandscapeView
{
    UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;

    if (UIDeviceOrientationIsLandscape(deviceOrientation) && !isShowingLandscapeView) {
        [self presentModalViewController:self.landscapeViewController animated:YES];
        isShowingLandscapeView = YES;
    } else if (deviceOrientation == UIDeviceOrientationPortrait && isShowingLandscapeView) {
		[self dismissModalViewControllerAnimated:YES];
        isShowingLandscapeView = NO;
    }    
}

- (void)filterAction:(id)sender {
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

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait); // support only portrait
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dataController countOfList]+1;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	//Try to get rusable cell
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
	if (cell == nil) {
		//If not possible create a new cell
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"] 
				autorelease];
	}

	cell.backgroundColor = [UIColor colorWithHue:0 saturation:0.5 brightness:0.5 alpha:0.5];
	cell.layer.masksToBounds = YES;
	cell.layer.cornerRadius = 15.0;
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	
	// Get the string to display and set the value in the cell
	//Retreive text from datasource
	if(indexPath.row == 0) {
		//The first (or zeroth cell) contains a New Item string and is used to add elements to list
		[cell.textLabel setText:@"New Item..."];
	} else {
		[cell.textLabel setText:[dataController objectInListAtIndex:indexPath.row-1]];
	}

	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


@end

