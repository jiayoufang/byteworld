//
//  JYIntrolView.h
//  ByteWorld
//
//  Created by fangjiayou on 15/4/12.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JYIntrolView;
@protocol JYIntrolViewDelegate <NSObject>

@optional
-(void)finishedButtonClick;

@end

@interface JYIntrolView : UIView

@property(nonatomic,assign)id<JYIntrolViewDelegate>delegate;

@end
