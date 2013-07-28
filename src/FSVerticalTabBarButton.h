//
//  FSVerticalTabBarButton.h
//  iOS-Platform
//
//  Created by Błażej Biesiada on 4/8/12.
//  Copyright (c) 2012 Future Simple. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FSVerticalTabBarButton : UITableViewCell


@property (nonatomic, readwrite, assign) UIColor *selectedImageTintColor;
@property (nonatomic, readwrite, strong) UIImage *iconImage;
@property (nonatomic, readwrite, strong) UIImage *iconSelectedImage;


@end
