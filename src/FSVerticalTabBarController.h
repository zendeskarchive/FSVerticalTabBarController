//
//  FSVerticalTabBarController.h
//  iOS-Platform
//
//  Created by Błażej Biesiada on 4/6/12.
//  Copyright (c) 2012 Future Simple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSVerticalTabBar.h"


@class FSVerticalTabBarController, FSVerticalTabBar;


@protocol FSTabBarControllerDelegate <NSObject>
@optional
- (void)tabBarController:(FSVerticalTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController;
- (BOOL)tabBarController:(FSVerticalTabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController;
@end


@interface FSVerticalTabBarController : UIViewController <UITableViewDelegate>


@property (nonatomic, readwrite, assign) id<FSTabBarControllerDelegate> delegate;
@property (nonatomic, readwrite, strong) FSVerticalTabBar *tabBar;
@property (nonatomic, readwrite, copy) NSArray *viewControllers;
@property (nonatomic, readwrite, assign) UIViewController *selectedViewController;
@property (nonatomic, readwrite, assign) NSUInteger selectedIndex;
@property (nonatomic, readwrite, assign) CGFloat tabBarWidth;


- (void)setViewControllers:(NSArray *)viewControllers animated:(BOOL)animated;


@end
