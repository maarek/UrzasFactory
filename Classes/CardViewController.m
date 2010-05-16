    //
//  CardViewController.m
//  UrzasFactory
//
//  Created by Cameron Knight on 4/28/10.
//  Copyright 2010 Moblico. All rights reserved.
//

#import "CardViewController.h"
#import "Card.h"

@implementation CardViewController

@synthesize card, fields;

- (void)viewDidLoad {
	[super viewDidLoad];
	self.tableView.delegate = self;
	NSArray * keys = [NSArray arrayWithObjects:
					  @"flavor",
					  @"power",
					  @"multiverseID",
					  @"convertedManaCost",
					  @"text",
					  @"toughness",
					  @"loyalty",
					  @"name",
					  @"rarity",
//					  @"otherSets",
//					  @"manas",
//					  @"decks",
//					  @"type",
//					  @"expansion",
//					  @"artist",
					  nil];
	
	NSMutableDictionary * dict = [NSMutableDictionary dictionary];
	for (id key in keys) {
		if ([card valueForKey:key]) {
			NSLog(@"%@ - %@", key, [card valueForKey:key]);
			[dict setValue:[card valueForKey:key] forKey:key];
		}
	}
	self.fields = dict;
	[self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	[self.navigationController setNavigationBarHidden:NO animated:animated];
	if (card.name) self.title = card.name;
	else self.title = @"Card";
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	NSLog(@"COUNT: %d",[fields count]);
    return [fields count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier] autorelease];
    }
	
    cell.backgroundColor = [UIColor colorWithHue:0 saturation:0.5 brightness:0.5 alpha:0.5];
	NSString * text = nil;
	NSString * detail = nil;
	
	if ([[[fields allKeys] objectAtIndex:indexPath.row] isKindOfClass:[NSString class]]) {
		text = [[fields allKeys] objectAtIndex:indexPath.row];
	} else {
		text = [[[fields allKeys] objectAtIndex:indexPath.row] stringValue];
	}
	
	if ([[[fields allValues] objectAtIndex:indexPath.row] isKindOfClass:[NSString class]]) {
		detail = [[fields allValues] objectAtIndex:indexPath.row];
	} else if ([[[fields allValues] objectAtIndex:indexPath.row] isKindOfClass:[NSData class]]) {
		NSString *stringFromData = [[NSString alloc]  initWithBytes:[[[fields allValues] objectAtIndex:indexPath.row] bytes]
															 length:[[[fields allValues] objectAtIndex:indexPath.row] length] 
														   encoding:NSUTF8StringEncoding];
		detail = [NSString stringWithString:stringFromData];
		[stringFromData release];

	} else {
		detail = [NSString stringWithString:[[[fields allValues] objectAtIndex:indexPath.row] stringValue]];
	}
	
	cell.textLabel.text = text;
	cell.detailTextLabel.text = detail;
	//	cell.imageView.image = [UIImage imageNamed:@"Icon.png"];
    // Set up the cell...
	
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView  titleForHeaderInSection:(NSInteger)section {
    // Display the dates as section headings.
    return nil;//[[[[self fetchedResultsController] sections] objectAtIndex:section] name];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
}

@end
