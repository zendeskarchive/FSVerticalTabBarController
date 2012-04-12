This project aims to replicate UITabBarController functionality and behavior, but with a vertical tab bar.

There's no controller for customizing the tab bar in runtime (aka "More" tab), instead the tab bar can accommodate an "infinite" number of tabs because it's a UITableView under the hood (but the scrolling is automatically turned off if it's not necessary).

While some may find it production ready there's still many things that can be added/improved/(fixed), thus all contributions are welcomed. Here's a sneak peek at how it looks like with 120px with tab bar and a textured image as background.

![](https://github.com/futuresimple/FSVerticalTabBarController/raw/master/images/sample_screenshot.png)

Requirements:
* iOS5 or above
* Automatic Reference Counting

TODO:
* add tab bar gradient drawing (currently one can only use images)
* add more delegate methods
* add sample code
* test it with Interface Builder (do we need it? :)
* probably many other
