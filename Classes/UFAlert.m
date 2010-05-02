//
//  UFAlert.m
//  UrzasFactory
//
//  Created by Jeremy Lyman on 4/27/10.
//  Copyright 2010 Jeremy Lyman. All rights reserved.
//

#import "UFAlert.h"

@implementation UFAlert

@synthesize cardSlider;
@synthesize cardCount;

- (id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle okButtonTitle:(NSString *)okayButtonTitle {
	
    if (self = [super initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:okayButtonTitle, nil]) {
		UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(12.0, 45.0, 220.0, 25.0)];
		[slider addTarget:self action:@selector(slidersMoved:) forControlEvents:UIControlEventValueChanged];
		slider.minimumValue = 1.0;
		slider.maximumValue = 10.0;
		slider.continuous = YES;
		slider.value = 1.0;
		[self addSubview:slider];
		self.cardSlider = slider;
		[slider release];
		
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(235.0, 45.0, 50.0, 25.0)];
		label.backgroundColor = [UIColor clearColor];
		label.textColor = [UIColor whiteColor];
		[label setText:@"0"];
		[self addSubview:label];
		self.cardCount = label;
		[label release];
		
		// To move the alert view if needed
        //CGAffineTransform translate = CGAffineTransformMakeTranslation(0.0, 130.0); 
        //[self setTransform:translate];
    }
    return self;
}

- (void)show {
    [super show];
}

-(void)slidersMoved:(id)sender {
	UISlider *slider = (UISlider *)sender;
	int count = (int)(slider.value + 0.5f);
	[cardCount setText:[NSString stringWithFormat:@"%d", count]]; 
}

-(void)resetSliders:(id)sender {
	
}

- (void)dealloc {
    [super dealloc];
	[cardCount release];
	[cardSlider release];
}

@end
