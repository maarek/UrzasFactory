//
//  UINavigationBar+CustomImage.m
//  UrzasFactory
//
//  Created by Jeremy Lyman on 4/27/10.
//  Copyright 2010 Jeremy Lyman. All rights reserved.
//

#import "UINavigationBar+CustomImage.h"
//Global dictionary for recording background image
static NSMutableDictionary *navigationBarImages = NULL;

@implementation UINavigationBar(CustomImage)
//Overrider to draw a custom image

+ (void)initImageDictionary
{
    if(navigationBarImages==NULL){
        navigationBarImages=[[NSMutableDictionary alloc] init];
    }   
}

- (void)drawRect:(CGRect)rect
{
    NSString *imageName=[navigationBarImages objectForKey:[NSValue valueWithNonretainedObject: self]];
    if (imageName==nil) {
        imageName=@"backdropTop.png";
    }
    UIImage *image = [UIImage imageNamed: imageName];
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
}

//Allow the setting of an image for the navigation bar
- (void)setImage:(UIImage*)image
{
    [navigationBarImages setObject:image forKey:[NSValue valueWithNonretainedObject: self]];
}

@end
