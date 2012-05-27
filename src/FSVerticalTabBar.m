//
//  FSVerticalTabBar.m
//  iOS-Platform
//
//  Created by Błażej Biesiada on 4/6/12.
//  Copyright (c) 2012 Future Simple. All rights reserved.
//

#import "FSVerticalTabBar.h"
#import "FSVerticalTabBarButton.h"
#import <QuartzCore/QuartzCore.h>


#define DEFAULT_ITEM_HEIGHT 80.0


@implementation FSVerticalTabBar

@synthesize items = _items;
@synthesize backgroundImage = _backgroundImage;
@synthesize selectedImageTintColor = _selectedImageTintColor;
@synthesize selectionIndicatorImage = _selectionIndicatorImage;
@synthesize drawGloss = _drawGloss;
@synthesize tintColor = _tintColor;

- (void)setItems:(NSArray *)items
{
    _items = [items copy];
    [self reloadData];
}


- (void)setSelectionIndicatorImage:(UIImage *)selectionIndicatorImage
{
    _selectionIndicatorImage = selectionIndicatorImage;
    // apply changes
    [self reloadData];
}


- (void)setSelectedImageTintColor:(UIColor *)selectedImageTintColor
{
    _selectedImageTintColor = selectedImageTintColor;
    // apply changes
    [self reloadData];
}

- (void)setBackgroundImage:(UIImage *)backgroundImage
{
    _backgroundImage = backgroundImage;
    
    // apply changes
    if (UIEdgeInsetsEqualToEdgeInsets(backgroundImage.capInsets,UIEdgeInsetsZero)) // aka non resizable image
    {
        self.backgroundView = [UIView new];
        self.backgroundColor = [UIColor clearColor];
        self.backgroundView.backgroundColor = [UIColor colorWithPatternImage:backgroundImage]; // tile background with the image
    }
    else
    {
        self.backgroundView = [[UIImageView alloc] initWithImage:backgroundImage];
    }
}


- (void)setSelectedItem:(UITabBarItem *)selectedItem
{
    NSUInteger selectedItemIndex = [self.items indexOfObject:selectedItem];
    if (selectedItemIndex != NSNotFound)
    {
        [self selectRowAtIndexPath:[NSIndexPath indexPathForRow:selectedItemIndex
                                                      inSection:0]
                          animated:YES
                    scrollPosition:UITableViewRowAnimationTop];
    }
}


- (UITabBarItem *)selectedItem
{
    NSIndexPath *selectedRowIndexPath = self.indexPathForSelectedRow;
    if (selectedRowIndexPath != nil)
    {
        return [self.items objectAtIndex:selectedRowIndexPath.row];
    }
    else
    {
        return nil;
    }
}

- (void)setDrawGloss:(BOOL)drawGloss
{
    if (drawGloss != _drawGloss) {
        _drawGloss = drawGloss;
        
        self.backgroundColor = [UIColor clearColor];
        
        [self setNeedsDisplay];
    }
}

- (void)setTintColor:(UIColor *)tintColor
{
    if (tintColor != _tintColor) {
        _tintColor = tintColor;
        self.backgroundColor = tintColor;
        [self setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    if (self.drawGloss && self.backgroundImage == nil) 
    {
        CGRect bounds = self.bounds;
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSaveGState(context);
        
        // flip the coordinates system
        CGContextTranslateCTM(context, 0.0, bounds.size.height);
        CGContextScaleCTM(context, 1.0, -1.0);
        
        // draw gradient
        CGContextClipToRect(context, bounds);
        CGContextSetFillColorWithColor(context, self.tintColor.CGColor);
        CGContextFillRect(context, bounds);
        
        NSArray *colors = [NSArray arrayWithObjects:
                           (id)[UIColor colorWithWhite:0.9f alpha:0.15f].CGColor,
                           (id)[UIColor colorWithWhite:0.9f alpha:0.1f].CGColor,
                           (id)[UIColor clearColor].CGColor,
                           (id)[UIColor clearColor].CGColor,
                           nil];
        
        CGFloat locations[4] = {0.0,0.5,0.5,1.0};
        
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGGradientRef colorGradient = CGGradientCreateWithColors(colorSpace, (__bridge  CFArrayRef)colors, locations);
        
        CGPoint start = CGPointMake(bounds.origin.x + bounds.size.width, bounds.origin.y);
        CGPoint end = CGPointMake(bounds.origin.x, bounds.origin.y);
        
        CGContextDrawLinearGradient(context, colorGradient, start, end, 0);
        
        CGGradientRelease(colorGradient);
        CGContextRestoreGState(context);
    }
    
}


#pragma mark -
#pragma mark FSVerticalTabBar
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame style:UITableViewStylePlain];
    if (self)
    {
        self.dataSource = self;
        self.rowHeight = DEFAULT_ITEM_HEIGHT;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        // set default selection image
        UIImage *defaultSelectionIndicatorImage = [UIImage imageNamed:@"selectionIndicatorImage"];
        defaultSelectionIndicatorImage = [defaultSelectionIndicatorImage resizableImageWithCapInsets:UIEdgeInsetsMake(2, 6, 2, 6)];
        _selectionIndicatorImage = defaultSelectionIndicatorImage;

        self.drawGloss = NO;
        self.tintColor = [UIColor blackColor];
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.scrollEnabled = (self.rowHeight * [self.items count]) > self.bounds.size.height;
}


#pragma mark -
#pragma mark <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *vtbci = @"vtbci";
    FSVerticalTabBarButton *cell = [tableView dequeueReusableCellWithIdentifier:vtbci];
    if (cell == nil)
    {
        cell = [[FSVerticalTabBarButton alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:vtbci];
    }
    
    cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:self.selectionIndicatorImage];
    
    UITabBarItem *item = [self.items objectAtIndex:indexPath.row];
    cell.textLabel.text = item.title;
    cell.iconImage = item.image;
    
    return cell;
}

@end
