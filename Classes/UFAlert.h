//
//  UFAlert.h
//  UrzasFactory
//
//  Created by Jeremy Lyman on 4/27/10.
//  Copyright 2010 Jeremy Lyman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UFAlert : UIAlertView {
	UISlider *cardSlider;
	UILabel *cardCount;
}

@property (nonatomic, retain) UISlider *cardSlider;
@property (nonatomic, retain) UILabel *cardCount;

-(void)slidersMoved:(id)sender;
-(void)resetSliders:(id)sender;

- (id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle okButtonTitle:(NSString *)okButtonTitle;


@end