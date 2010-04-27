//
//  CreditsViewController.h
//  UrzasFactory
//
//  Created by Jeremy Lyman on 4/27/10.
//  Copyright 2010 Jeremy Lyman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h> 

@interface CreditsViewController : UIViewController {
	UITableViewCell *cell;
}

@property (nonatomic, retain) IBOutlet UITableViewCell *cell;

@end
