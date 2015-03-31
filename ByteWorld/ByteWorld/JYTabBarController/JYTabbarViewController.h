//
//  JYTabbarViewController.h
//  ByteWorld
//
//  Created by 方 on 15/3/31.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JYTabbarViewController : UITabBarController

@property(nonatomic,strong) UIView *tabBarView;

-(void)showTabBar:(BOOL)show;

@end
