//
//  WaterFallCollectionViewCell.m
//  ByteWorld
//
//  Created by 方 on 15/3/31.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "WaterFallCollectionViewCell.h"

@implementation WaterFallCollectionViewCell

-(void)setImage:(UIImage *)image
{
    if (_image != image) {
        _image = image;
    }
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGFloat newHeight = _image.size.height/_image.size.width * 100;
    [_image drawInRect:CGRectMake(0, 0, 100, newHeight)];
}

@end
