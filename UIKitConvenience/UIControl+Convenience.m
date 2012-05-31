//
//  UIControl+Convenience.m
//  UIControlConvenience
//
//  Created by Eric Goldberg on 5/31/12.
//  Copyright (c) 2012 Eric Goldberg. All rights reserved.
//

#import "UIControl+Convenience.h"

@implementation UIControl (Convenience)

-(void)removeAllTargetActionEvents
{
    [self removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];
}

@end
