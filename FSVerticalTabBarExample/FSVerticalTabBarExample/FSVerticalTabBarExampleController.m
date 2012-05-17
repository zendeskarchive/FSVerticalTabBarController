//
//  FSViewController.m
//  FSVerticalTabBarExample
//
//  Created by Truman, Christopher on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FSVerticalTabBarExampleController.h"
#import "FSVerticalTabBarController.h"

@interface FSVerticalTabBarExampleController ()

@end

@implementation FSVerticalTabBarExampleController

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    //create view controllers
    UIViewController *viewRed = [[UIViewController alloc] init];
    UIViewController *viewBlue = [[UIViewController alloc] init];
    UIViewController *viewGreen = [[UIViewController alloc] init];
    UIViewController *viewBrown = [[UIViewController alloc] init];
    UIViewController *viewYellow = [[UIViewController alloc] init];
    UIViewController *viewWhite = [[UIViewController alloc] init];
    
    //change background colors
    [viewBlue.view setBackgroundColor:[UIColor blueColor]];
    [viewGreen.view setBackgroundColor:[UIColor greenColor]];
    [viewBrown.view setBackgroundColor:[UIColor brownColor]];
    [viewYellow.view setBackgroundColor:[UIColor yellowColor]];
    [viewWhite.view setBackgroundColor:[UIColor whiteColor]];
    [viewRed.view setBackgroundColor:[UIColor redColor]];

    //Create tabItems for the view controller
    viewRed.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"tab 1" image:[UIImage imageNamed:@"magnifying-glass.png"] tag: 0];
    viewBlue.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"tab 2" image:[UIImage imageNamed:@"magnifying-glass.png"] tag:1];
    viewGreen.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"tab 3" image:[UIImage imageNamed:@"magnifying-glass.png"] tag:2];
    viewBrown.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"tab 4" image:[UIImage imageNamed:@"magnifying-glass.png"] tag:3];
    viewYellow.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"tab 5" image:[UIImage imageNamed:@"magnifying-glass.png"] tag:4];
    viewWhite.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"tab 5" image:[UIImage imageNamed:@"magnifying-glass.png"] tag:5];
    
    //set the view controllers of the the tab bar controller
    [self setViewControllers:[NSArray arrayWithObjects:viewRed,viewBlue,viewGreen,viewBrown,viewYellow,viewWhite, nil]];
        
    //set the background color to a texture
    [[self tabBar] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"ios-linen.png"]]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }
}

@end
