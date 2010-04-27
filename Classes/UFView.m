//
//  DecksView.m
//  UrzasFactory
//
//  Created by Cameron Knight on 2/25/10.
//  Copyright 2010 Moblico. All rights reserved.
//

#import "UFView.h"


@implementation UFView


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
     	UIImageView * backgroundView = [[UIImageView alloc] initWithFrame:frame];
		backgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backdropBottom.png"]];
		//[backgroundView setImage:[UIImage imageNamed:@"backdropBottom.png"]];
		backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
		[self addSubview:backgroundView];
		[backgroundView release];
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (void)dealloc {
    [super dealloc];
}


@end
