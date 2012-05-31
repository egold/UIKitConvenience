//
//  UIViewController+ForcedRotation.h
//  UIKitConvenience
//
//  Created by Eric Goldberg on 5/31/12.
//  Copyright (c) 2012 Eric Goldberg. All rights reserved.
//

/*
 
 Note: if you use this category to explicitly set UI orientation, you should NOT
    auto-rotate the UI when the device orientation changes.
 
    Basically, you should design each view to naturally follow the device orientation.
 */

#import <UIKit/UIKit.h>

@interface UIViewController (ForcedRotation)

-(void)rotateViewToPortrait;
-(void)rotateViewToLandscape;

@end
