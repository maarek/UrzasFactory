//
//  MainViewController.h
//  UrzasFactory
//
//  Created by Cameron Knight on 2/25/10.
//  Copyright 2010 Moblico. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MainViewController : UIViewController {
	UIButton * decksButton;
	UIButton * libraryButton;
	UIButton * creditsButton;
}

@property (nonatomic, retain) IBOutlet UIButton * decksButton;
@property (nonatomic, retain) IBOutlet UIButton * libraryButton;
@property (nonatomic, retain) IBOutlet UIButton * creditsButton;

- (IBAction)action:(id)sender;
@end
