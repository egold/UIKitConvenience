//
//  UIView+LayoutManipulation.m
//  UIKitConvenience
//
//  Created by Eric Goldberg on 6/8/12.
//  Copyright (c) 2012 Eric Goldberg. All rights reserved.
//

#import "UIView+LayoutManipulation.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (LayoutManipulation)

-(void)moveTo:(CGPoint)destPoint
{
    CGRect frame = self.frame;
    frame.origin = destPoint;
    self.frame = frame;
}

-(void)moveBy:(CGFloat)delta direction:(int)direction
{
    CGPoint center = self.center;
    switch (direction) 
    {
        case kUIViewLayoutManipulationDirectionUp:
            center.y -= delta;
            break;
        case kUIViewLayoutManipulationDirectionRight:
            center.x += delta;
            break;
        case kUIViewLayoutManipulationDirectionDown:
            center.y += delta;
            break;
        case kUIViewLayoutManipulationDirectionLeft:
            center.x -= delta;
            break;
    }
    self.center = center;
}

-(void)moveToCenterOfSuperview
{
    self.center = self.superview.center;
}

-(void)moveUpBy:(CGFloat)delta
{
    [self moveBy:delta direction:kUIViewLayoutManipulationDirectionUp];
}

-(void)moveRightBy:(CGFloat)delta
{
    [self moveBy:delta direction:kUIViewLayoutManipulationDirectionRight];
}

-(void)moveDownBy:(CGFloat)delta
{
    [self moveBy:delta direction:kUIViewLayoutManipulationDirectionDown];
}

-(void)moveLeftBy:(CGFloat)delta
{
    [self moveBy:delta direction:kUIViewLayoutManipulationDirectionLeft];
}

-(void)show
{
    self.hidden = NO;
}

-(void)hide
{
    self.hidden = YES;
}

-(void)fadeOut
{
    [UIView animateWithDuration:kUIViewLayoutManipulationAnimationDuration 
                     animations:^{
                         
                         self.alpha = 0.0;
                     } completion:^(BOOL finished) {
                         
                         if (finished) {
                             self.hidden = YES;
                         }
                     }];
}

-(void)fadeOutAndRemoveFromSuperview
{
    [UIView animateWithDuration:kUIViewLayoutManipulationAnimationDuration 
                     animations:^{
                         
                         self.alpha = 0.0;
                     } completion:^(BOOL finished) {
                         
                         if (finished) {
                             [self removeFromSuperview];
                         }
                     }];
}

-(void)fadeIn
{
    if (self.hidden)
    {
        self.alpha = 0.0;
        self.hidden = NO;
    }
    
    [UIView animateWithDuration:kUIViewLayoutManipulationAnimationDuration 
                     animations:^{
                         
                         self.alpha = 1.0;
                     }];
}

-(void)collapseToPointAndRemoveFromSuperview
{
	self.backgroundColor = [UIColor clearColor];
    self.opaque = NO;
    
	UIImage *viewImage = [self imageSnapshot];
	
	for (UIView* subview in self.subviews) {
		subview.hidden = YES;
	}
	
	UIImageView* screenshotView = [[UIImageView alloc] initWithImage:viewImage];
	[self addSubview:screenshotView];
	
    [UIView animateWithDuration:kUIViewLayoutManipulationAnimationDuration 
                     animations:^{
                     
                         [screenshotView resizeInPlaceToSize:CGSizeMake(1, 1)];
                     } 
                     completion:^(BOOL finished) {
                         
                         if (finished) {
                             [self removeFromSuperview];
                         }
                     }];
}

-(void)expandFromPoint
{
    BOOL originalOpacityValue = self.opaque;
    
    self.backgroundColor = [UIColor clearColor];
	self.opaque = NO;
    
    NSMutableArray* viewsThatGetHidden = [NSMutableArray array];
    
	UIImage* viewImage = [self imageSnapshot];
	for (UIView* subview in self.subviews) {
        if (NO == subview.hidden) {
            subview.hidden = YES;
            [viewsThatGetHidden addObject:subview];
        }
	}

	UIImageView* screenshotView = [[UIImageView alloc] initWithImage:viewImage];
    
	[self addSubview:screenshotView];
    [screenshotView resizeInPlaceToSize:CGSizeMake(1, 1)];
    [screenshotView moveToCenterOfSuperview];
	
    [UIView animateWithDuration:kUIViewLayoutManipulationAnimationDuration 
                     animations:^{
                         
                         screenshotView.frame = self.frame;
                     } 
                     completion:^(BOOL finished) {

                         if (finished)
                         {
                             [screenshotView removeFromSuperview];
                             self.opaque = originalOpacityValue;
                             for (UIView* subview in viewsThatGetHidden) 
                             {
                                 subview.hidden = NO;
                             }
                         }
                     }];
}

-(void)resizeInPlaceToSize:(CGSize)size
{
    CGRect frame = self.frame;
    CGPoint originalCenter = self.center;
    
    frame.size = size;
    self.frame = frame;
    self.center = originalCenter;
}

-(UIImage *)imageSnapshot
{
    CGSize size = self.bounds.size;
	if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
		if ([[UIScreen mainScreen] scale] == 2.0) {
			UIGraphicsBeginImageContextWithOptions(size, NO, 2.0);
		} else {
			UIGraphicsBeginImageContext(size);
		}
	} else {
		UIGraphicsBeginImageContext(size);
	}
	[(CALayer*)self.layer renderInContext:UIGraphicsGetCurrentContext()];
	UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return image;
}

@end
