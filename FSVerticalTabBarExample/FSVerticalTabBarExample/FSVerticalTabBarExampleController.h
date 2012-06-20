//
//  FSViewController.h
//  FSVerticalTabBarExample
//
//  Created by Truman, Christopher on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSVerticalTabBarController.h"
#import "PopoverController.h"

@interface FSVerticalTabBarExampleController : FSVerticalTabBarController<FSTabBarControllerDelegate, UIPopoverControllerDelegate, PopoverDelegate>

@property (nonatomic, strong) UIPopoverController *popOver;


@end
