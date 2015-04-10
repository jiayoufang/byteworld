//
//  JYLabel.m
//  ByteWorld
//
//  Created by 方 on 15/4/10.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "JYLabel.h"

@implementation JYLabel


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //添加删除线
//    UIFont *font = [UIFont systemFontOfSize:self.font.pointSize];
//    CGSize size = CGSizeMake(320,2000);
//    CGRect labelRect = [self.text boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)  attributes:[NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName] context:nil];
//    CGContextRef c = UIGraphicsGetCurrentContext();
//    CGContextSetStrokeColorWithColor(c, [UIColor redColor].CGColor);
//    CGContextSetLineWidth(c, 1);
//    CGContextBeginPath(c);
//    CGFloat halfWayUp = rect.size.height/2 + rect.origin.y;
//    CGContextMoveToPoint(c, rect.origin.x, halfWayUp );//开始点
//    CGContextAddLineToPoint(c, rect.origin.x + labelRect.size.width, halfWayUp);//结束点
//    CGContextStrokePath(c);
    
    //加上额外的符号
    UIFont *font = [UIFont systemFontOfSize:self.font.pointSize];
    UIFont *fuhaofont = [UIFont systemFontOfSize:12];
    UIColor *color = [UIColor redColor];
    CGSize size = CGSizeMake(320,2000);
    CGRect labelRect = [self.text boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)  attributes:[NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName] context:nil];
    NSString *fuhao = @"￥";
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(c, color.CGColor);
    [fuhao drawAtPoint:CGPointMake(rect.size.width - labelRect.size.width - 12, 4) withAttributes:@{NSFontAttributeName:fuhaofont,NSForegroundColorAttributeName:color}];
    CGContextStrokePath(c);
 
}


@end
