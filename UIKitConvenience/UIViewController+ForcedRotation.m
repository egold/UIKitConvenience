//
//  UIViewController+ForcedRotation.m
//  UIKitConvenience
//
//  Created by Eric Goldberg on 5/31/12.
//  Copyright (c) 2012 Eric Goldberg. All rights reserved.
//

#import "UIViewController+ForcedRotation.h"

@implementation UIViewController (ForcedRotation)

-(void)rotateViewToPortrait
{
    self.view.transform = CGAffineTransformIdentity;
    
    if ([UIDevice currentDevice].orientation == UIDeviceOrientationPortraitUpsideDown)
    {
        //use "portrain" orientation if device is already oriented that way
        self.view.transform = CGAffineTransformMakeRotation(M_PI);
        [UIApplication sharedApplication].statusBarOrientation = UIInterfaceOrientationPortraitUpsideDown;
    }
    else 
    {
        //use "portrait up" orientation
        [UIApplication sharedApplication].statusBarOrientation = UIInterfaceOrientationPortrait;
    }
}

-(void)rotateViewToLandscape
{
    
    if ([UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeLeft)
    {
        //use "landscape left" orientation if device is already oriented that way
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight
                                                          animated:NO];
        self.view.transform = CGAffineTransformIdentity;
        self.view.transform = CGAffineTransformMakeRotation(M_PI_2);
    }
    else 
    {
        //use "landscape right" orientation by default
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeLeft 
                                                          animated:NO];
        self.view.transform = CGAffineTransformIdentity;
        self.view.transform = CGAffineTransformMakeRotation(-M_PI_2);
    }
}

@end
