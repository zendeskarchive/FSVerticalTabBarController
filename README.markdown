# Overview

This project aims to replicate UITabBarController functionality and behavior, but with a vertical tab bar.

There's no controller for customizing the tab bar in runtime (aka "More" tab), instead the tab bar can accommodate an "infinite" number of tabs because it's a UITableView under the hood (but the scrolling is automatically turned off if it's not necessary).

While some may find it production ready there's still many things that can be added/improved/(fixed), thus all contributions are welcomed. Here's a sneak peek at how it looks like with 120px with tab bar and a textured image as background.

<!-- MacBuildServer Install Button -->
<div class="macbuildserver-block">
    <a class="macbuildserver-button" href="http://macbuildserver.com/project/github/build/?xcode_project=FSVerticalTabBarExample%2FFSVerticalTabBarExample.xcodeproj&amp;target=FSVerticalTabBarExample&amp;repo_url=git%3A%2F%2Fgithub.com%2Ffuturesimple%2FFSVerticalTabBarController.git&amp;build_conf=Release" target="_blank"><img src="http://com.macbuildserver.github.s3-website-us-east-1.amazonaws.com/button_up.png"/></a><br/><sup><a href="http://macbuildserver.com/github/opensource/" target="_blank">by MacBuildServer</a></sup>
</div>
<!-- MacBuildServer Install Button -->

![](https://github.com/futuresimple/FSVerticalTabBarController/raw/master/images/sample_screenshot.png)

Currently includes a sample Universal project that will run on iPad and iPhone.  Basic usage is as follows:

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


# Requirements:

 * iOS5 or above
 * Automatic Reference Counting

# TODO:

 * add tab bar gradient drawing (currently one can only use images)
 * add more delegate methods
 * add (better) sample code
 * test it with Interface Builder (do we need it? :)
 * probably many other
