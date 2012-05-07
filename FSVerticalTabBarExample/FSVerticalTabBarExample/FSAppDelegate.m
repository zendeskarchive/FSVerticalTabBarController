//
//  FSAppDelegate.m
//  FSVerticalTabBarExample
//
//  Created by Truman, Christopher on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FSAppDelegate.h"
#import "FSVerticalTabBarController.h"
#import "FSViewController.h"

@implementation FSAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
 self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  FSVerticalTabBarController * tc = [[FSVerticalTabBarController alloc] init];
  
  //Create the first view controller
  FSViewController * vc = [[FSViewController alloc] init];
  
  //Create tabItem for the view controller
  vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"tab 1" image:[UIImage imageNamed:@"magnifying-glass.png"] tag:0];
  
  //create another view controller
  FSViewController * vc1 = [[FSViewController alloc] init];
  
  //change background color of second view to differentiate
  [vc1.view setBackgroundColor:[UIColor blueColor]];
  vc1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"tab 2" image:[UIImage imageNamed:@"magnifying-glass.png"] tag:1];
  
  //set the view controllers of the the tab bar controller
  [tc setViewControllers:[NSArray arrayWithObjects:vc,vc1, nil]];
  
  //set one view controller to be selected
  [tc setSelectedViewController:vc];
  
  //set the background color to a texture
  [[tc tabBar] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"ios-linen.png"]]];
  
  //now add the TabBarController to the window as the root controller
	[[self window] setRootViewController:tc];
  [[self window] makeKeyAndVisible];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
