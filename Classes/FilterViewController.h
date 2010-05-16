//
//  FilterViewController.h
//  UrzasFactory
//
//  Created by Jeremy Lyman on 5/12/10.
//  Copyright 2010 Jeremy Lyman. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol FilterViewControllerDelegate;

@interface FilterViewController : UIViewController {
	id<FilterViewControllerDelegate> delegate;
	
	UIButton *forestButton;
	UIButton *islandButton;
	UIButton *mountainButton;
	UIButton *plainsButton;
	UIButton *swampButton;
	UIButton *landButton;
	
	NSDictionary *predicateDictionary;
	NSMutableDictionary *buttonDictionary;
	NSMutableDictionary *buttonStateDictionary;
}

@property (assign) id<FilterViewControllerDelegate> delegate;

@property (nonatomic, retain) IBOutlet UIButton *forestButton;
@property (nonatomic, retain) IBOutlet UIButton *islandButton;
@property (nonatomic, retain) IBOutlet UIButton *mountainButton;
@property (nonatomic, retain) IBOutlet UIButton *plainsButton;
@property (nonatomic, retain) IBOutlet UIButton *swampButton;
@property (nonatomic, retain) IBOutlet UIButton *landButton;

@property (nonatomic, retain) NSDictionary *predicateDictionary;
@property (nonatomic, retain) NSMutableDictionary *buttonDictionary;
@property (nonatomic, retain) NSMutableDictionary *buttonStateDictionary;

- (IBAction) buttonPressed:(id)sender;

@end

@protocol FilterViewControllerDelegate <NSObject>

- (void) updatePredicateDictionary:(NSMutableDictionary*)buttonStateDictionary;
- (void) modalDialogFinished:(id)sender;  

@end 
