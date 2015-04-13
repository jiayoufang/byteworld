//
//  JYButton.h
//  ByteWorld
//
//  Created by 方 on 15/4/13.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JYButton : UIButton

-(void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;
-(UIColor *)backgroundColorForState:(UIControlState)state;

@end
