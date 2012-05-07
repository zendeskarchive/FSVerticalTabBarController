//
//  FSVerticalTabBar.h
//  iOS-Platform
//
//  Created by Błażej Biesiada on 4/6/12.
//  Copyright (c) 2012 Future Simple. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FSVerticalTabBar : UITableView <UITableViewDataSource>


@property (nonatomic, readwrite, copy) NSArray *items;
@property (nonatomic, readwrite, assign) UITabBarItem *selectedItem;
@property (nonatomic, readwrite, strong) UIImage *backgroundImage;
@property (nonatomic, readwrite, strong) UIColor *selectedImageTintColor;
@property (nonatomic, readwrite, strong) UIImage *selectionIndicatorImage;


@end
