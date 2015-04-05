//
//  JYGroupModel.h
//  QQList
//
//  Created by fangjiayou on 15/4/5.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JYFriendsModel;
@interface JYGroupModel : NSObject

@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *online;
@property(nonatomic,strong) NSArray *friends;
@property(nonatomic,strong) JYFriendsModel *friendModel;
@property(nonatomic,assign) BOOL isOpen;

-(instancetype) initWithDict:(NSDictionary*)dict;

+(instancetype)GroupWithDict:(NSDictionary*)dict;

@end
