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
    
    //Create the first view controller
    UIViewController * viewRed = [[UIViewController alloc] init];
    
    //Create tabItem for the view controller
    viewRed.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"tab 1" image:[UIImage imageNamed:@"magnifying-glass.png"] tag: 0];
    [viewRed.view setBackgroundColor:[UIColor redColor]];

    //create another view controller
    UIViewController *viewBlue = [[UIViewController alloc] init];
    
    //change background color of second view to differentiate
    [viewBlue.view setBackgroundColor:[UIColor blueColor]];
    viewBlue.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"tab 2" image:[UIImage imageNamed:@"magnifying-glass.png"] tag:1];
    
    //set the view controllers of the the tab bar controller
    [self setViewControllers:[NSArray arrayWithObjects:viewRed,viewBlue, nil]];
        
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
