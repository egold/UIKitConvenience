//
//  UIView+LayoutManipulation.h
//  UIKitConvenience
//
//  Created by Eric Goldberg on 6/8/12.
//  Copyright (c) 2012 Eric Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kUIViewLayoutManipulationDirectionUp 8000
#define kUIViewLayoutManipulationDirectionRight 8001
#define kUIViewLayoutManipulationDirectionDown 8002
#define kUIViewLayoutManipulationDirectionLeft 8003

#define kUIViewLayoutManipulationAnimationDuration 0.3

@interface UIView (LayoutManipulation)

-(void)moveTo:(CGPoint)destPoint;
-(void)moveBy:(CGFloat)delta direction:(int)direction;
-(void)moveToCenterOfSuperview;
-(void)moveUpBy:(CGFloat)delta;
-(void)moveDownBy:(CGFloat)delta;
-(void)moveLeftBy:(CGFloat)delta;
-(void)moveRightBy:(CGFloat)delta;
-(void)show;
-(void)hide;
-(void)fadeOut;
-(void)fadeOutAndRemoveFromSuperview;
-(void)fadeIn;
-(void)collapseToPointAndRemoveFromSuperview;
-(void)expandFromPoint;
-(void)resizeInPlaceToSize:(CGSize)size;
-(UIImage *)imageSnapshot;

@end
