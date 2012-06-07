//
//  UIPageViewController+EnableToggle.m
//  UIKitConvenience
//
//  Created by Eric Goldberg on 6/6/12.
//  Copyright (c) 2012 Eric Goldberg. All rights reserved.
//

#import "UIPageViewController+EnableToggle.h"

@implementation UIPageViewController (EnableToggle)

-(void)disablePageTurning
{
    for (UIGestureRecognizer* recognizer in self.gestureRecognizers) 
    {
        recognizer.enabled = NO;
    }
}

-(void)enablePageTurning
{
    for (UIGestureRecognizer* recognizer in self.gestureRecognizers) 
    {
        recognizer.enabled = YES;
    }
}

@end
