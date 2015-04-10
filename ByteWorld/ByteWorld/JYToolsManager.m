//
//  JYToolsManager.m
//  ByteWorld
//
//  Created by 方 on 15/4/10.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "JYToolsManager.h"

@implementation JYToolsManager

+(instancetype)manager
{
    static JYToolsManager *_manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[self alloc]init];
    });
    return _manager;
}

//重写init方法
-(id)init
{
    if (self = [super init]) {
        
    }
    return self;
}

#pragma mark- 获取文本的高度size
-(CGSize)getSizeFromContent:(NSString  *)content size:(CGSize)size font:(UIFont *)font
{
    NSString *tmp = [NSString stringWithFormat:@"%@",content];
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,nil];
    //ios7方法，获取文本需要的size，限制宽度
    float systemVersion = [[[UIDevice currentDevice]systemVersion]floatValue];
    CGSize actualsize;
    
    if (systemVersion >= 7.0) {
        actualsize = [tmp boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    }else{
//        actualsize = [tmp sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];
        
    }
    
    return actualsize;
    
}

@end
