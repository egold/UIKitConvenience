UIKitConvenience
================

Some categories to help solve common needs for UIKit components.

Components
----------

### UIBarButtonItem+ImageItem

Provides a simple one-line factory for making bar button items as image buttons. Patterned after existing constructors of UIKit.

### UIControl+Convenience

Provides a method to remove all action/event pairs associated with a control (like a button).

### UIPageViewController+EnableToggle

Provides methods to enable/disable gesture-based page turning in a UIPageViewController. For instance, if you want to disable page turning while displaying something else on screen temporarily.

### UIViewController+ForcedRotation

Provides methods to force a portrait or landscape orientation for a view controller's view.

### UIView+ViewRecursion

Provides methods to perform an operation (specified as an Objective-C 2.0 block) on all subviews or all superviews of a given view. Also provides a convenience method to
enable or disable all UIControls in the hierarchy.

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

Forcing an interface rotation to portrait/landscape:

This uses CGAffineTransform to rotate the UI to the nearest portrait/landscape and sets the status bar
orientation. 

Sets the status bar to UIInterfaceOrientationPortrait / UIInterfaceOrientationPortraitUpsideDown / UIInterfaceOrientationLandscapeRight / UIInterfaceOrientationLandscapeLeft
based on a default, but if the device is already being held in the new orientation, will switch to the 
appropriate one (In other words, the user shouldn't get an upside-down UI)

```objc
#import "UIViewController+ForcedRotation.h"

- (IBAction)rotateLandscape:(id)sender 
{
    [self rotateViewToLandscape];
}

- (IBAction)rotatePortrait:(id)sender 
{
    [self rotateViewToPortrait];
}

```

Installation
-----

* Drag .h and .m files to your project
* Or, add project as dependency to your own project
* Import appropriate headers whenever you need to use them

Background
==========

I first created these categories because I find myself having common needs across apps that have complex or interesting interfaces. For instance, if you want to disable buttons on a page view controller while the page curl/flip animation is happening, because users may accidentally tap a button that's on the "back" of a page mid-animation.
