UIKitConvenience
================

Some categories to help solve common needs for UIKit components.

Usage
-----

Removing all actions on a UIButton:

```objc
#import "UIControl+Convenience.h"

-(void)someMethod
{
    [myButton removeAllTargetActionEvents];
}

```

Running a block of code on all subviews in a view hierarchy:

```objc
#import "UIView+SubviewRecursion.h"

@implementation MyFancyViewController

-(void)makeAllSubviewsGreen
{
    [self.view runBlockOnAllSubviews:^(UIView *view) {
    
        view.backgroundColor = [UIColor greenColor];
    }];
}
    
-(void)disableAllControls
{
    [self.view disableAllControlsInViewHierarchy];
}
    
@end

```

Installation
-----

* Drag .h and .m files to your project
* Or, add project as dependency to your own project
* Import appropriate headers whenever you need to use them

Background
==========

I first created these categories because I find myself having common needs across apps that have complex or interesting interfaces. For instance, if you want to disable buttons on a page view controller while the page curl/flip animation is happening, because users may accidentally tap a button that's on the "back" of a page mid-animation.