//
//  JYFriendsModel.h
//  QQList
//
//  Created by fangjiayou on 15/4/5.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JYFriendsModel : NSObject

@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *intro;
@property(nonatomic,assign) BOOL isVip;

-(instancetype)initWithDict:(NSDictionary*)dict;

+(instancetype)friendWithDict:(NSDictionary*)dict;


@end
