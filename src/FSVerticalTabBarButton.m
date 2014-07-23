//
//  FSVerticalTabBarButton.m
//  iOS-Platform
//
//  Created by Błażej Biesiada on 4/8/12.
//  Copyright (c) 2012 Future Simple. All rights reserved.
//

#import "FSVerticalTabBarButton.h"


@implementation FSVerticalTabBarButton

- (UIColor *)selectedImageTintColor
{
    // use blue tint by default
    return _selectedImageTintColor != nil ? _selectedImageTintColor : [UIColor colorWithRed:41.0/255.0 green:147.0/255.0 blue:239.0/255.0 alpha:1.0];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.textLabel.backgroundColor = [UIColor clearColor];
        self.textLabel.textColor = [UIColor lightGrayColor];
        self.textLabel.textAlignment = UITextAlignmentCenter;
        self.textLabel.font = [UIFont boldSystemFontOfSize:12.0];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // flip the coordinates system
    CGContextTranslateCTM(context, 0.0, bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    // draw an image in the center of the cell
    CGSize imageSize = self.iconImage.size;
    CGRect imageRect = CGRectMake(floorf(((bounds.size.width-imageSize.width)/2.0)),
                                  floorf(((bounds.size.height-imageSize.height)/2.0)+15),
                                  imageSize.width,
                                  imageSize.height);
    
    // draw either a selection gradient/glow or a regular image
    if (self.isSelected)
    {
        // setup shadow
        CGSize shadowOffset = CGSizeMake(0.0f, 1.0f);
        CGFloat shadowBlur = 3.0;
        CGColorRef cgShadowColor = [[UIColor blackColor] CGColor];
        
        // setup gradient
        CGFloat alpha0 = 0.8;
        CGFloat alpha1 = 0.6;
        CGFloat alpha2 = 0.0;
        CGFloat alpha3 = 0.1;
        CGFloat alpha4 = 0.5;
        CGFloat locations[5] = {0,0.55,0.55,0.7,1};
        
        CGFloat components[20] = {1,1,1,alpha0,1,1,1,alpha1,1,1,1,alpha2,1,1,1,alpha3,1,1,1,alpha4};
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGGradientRef colorGradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, (size_t)5);
        CGColorSpaceRelease(colorSpace);
        
        // set shadow
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlur, cgShadowColor);
        
        // set transparency layer and clip to mask
        CGContextBeginTransparencyLayer(context, NULL);
        CGContextClipToMask(context, imageRect, [self.iconImage CGImage]);
        
        // fill and end the transparency layer
        CGContextSetFillColorWithColor(context, [self.selectedImageTintColor CGColor]);
        CGContextFillRect(context, imageRect);
        CGPoint start = CGPointMake(CGRectGetMidX(imageRect), imageRect.origin.y);
        CGPoint end = CGPointMake(CGRectGetMidX(imageRect)-imageRect.size.height/4, imageRect.size.height+imageRect.origin.y);
        CGContextDrawLinearGradient(context, colorGradient, end, start, 0);
        CGContextEndTransparencyLayer(context);
        
        CGGradientRelease(colorGradient);
    }
    else
    {
        CGContextDrawImage(context,
                           imageRect,
                           self.iconImage.CGImage);
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect textLabelFrame = CGRectMake(0,
                                       NAN,
                                       self.bounds.size.width,
                                       self.textLabel.font.lineHeight);
    textLabelFrame.origin.y = self.bounds.size.height-textLabelFrame.size.height - 15;
    self.textLabel.frame = textLabelFrame;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    [self setNeedsDisplay];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    [self setNeedsDisplay];
}

@end
