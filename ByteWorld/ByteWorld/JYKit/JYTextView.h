//
//  JYTextView.h
//  ByteWorld
//
//  Created by fangjiayou on 15/4/12.
//  Copyright (c) 2015年 方. All rights reserved.
//

/**
 可以添加缺省文字
 */
#import <UIKit/UIKit.h>

@interface JYTextView : UITextView

@property (nonatomic,copy) NSString *placeholder;
@property (nonatomic,strong) UIColor *placeholderColor;
@property (nonatomic,strong) UIFont *placeholderFont;

@end
