//
//  JYGroupModel.m
//  QQList
//
//  Created by fangjiayou on 15/4/5.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "JYGroupModel.h"
#import "JYFriendsModel.h"

@implementation JYGroupModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        
        NSMutableArray *muArray = [NSMutableArray array];
        for (NSDictionary *dict in self.friends) {
            JYFriendsModel *model = [JYFriendsModel friendWithDict:dict];
            [muArray addObject:model];
        }
        self.friends = muArray;
    }
    return self;
}

+(instancetype)GroupWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

@end
