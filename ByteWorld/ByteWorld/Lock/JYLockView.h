//
//  JYLockView.h
//  ByteWorld
//
//  Created by fangjiayou on 15/4/5.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JYLockView;
@protocol JYLockViewDelegate <NSObject>

@optional
-(void)lockView:(JYLockView*)lockView didFinishPath:(NSString*)path;

@end

@interface JYLockView : UIView

@property(nonatomic,assign) id<JYLockViewDelegate>delegate;

@end
