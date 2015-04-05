//
//  JYHeaderView.h
//  QQList
//
//  Created by fangjiayou on 15/4/5.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JYGroupModel.h"

@class JYHeaderView;
@protocol JYHeaderViewDelegate <NSObject>

@optional
-(void)clickView:(NSInteger)section;

@end

@interface JYHeaderView : UITableViewHeaderFooterView

@property(nonatomic,assign) id<JYHeaderViewDelegate>delegate;
@property(nonatomic,strong) JYGroupModel *groupModel;

+(instancetype)headerView:(UITableView*)tableView;

@end
