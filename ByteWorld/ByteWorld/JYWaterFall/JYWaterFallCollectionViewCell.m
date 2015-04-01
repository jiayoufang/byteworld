//
//  JYWaterFallCollectionViewCell.m
//  ByteWorld
//
//  Created by 方 on 15/4/1.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "JYWaterFallCollectionViewCell.h"

@implementation JYWaterFallCollectionViewCell

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

-(void)setupView
{
    _imageView = [[UIImageView alloc]init];
//    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
//    _imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.contentView addSubview:_imageView];
    
    _label = [[UILabel alloc]init];
    _label.backgroundColor = [UIColor redColor];
    _label.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_label];
}

-(void)layoutSubviews
{
    _imageView.frame = self.contentView.bounds;
    _label.frame = CGRectMake(0, 0, CGRectGetWidth(self.contentView.bounds), 40);
}

@end
