//
//  UINavigationBar+CustomImage.h
//  UrzasFactory
//
//  Created by Jeremy Lyman on 4/27/10.
//  Copyright 2010 Jeremy Lyman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UINavigationBar(CustomImage)

+ (void) initImageDictionary;
- (void) drawRect:(CGRect)rect;
- (void) setImage:(UIImage*)image;

@end

