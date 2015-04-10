//
//  UILabel+Additions.m
//
//
//  Created by lixiang on 13-11-5.
//  Copyright (c) 2013年 . All rights reserved.
//

#import "UILabel+Additions.h"

@implementation UILabel (Additions)

- (void)adjustFontWithMaxSize:(CGSize)maxSize {
    CGSize stringRect;
    if (CGSizeEqualToSize(maxSize, CGSizeZero)) {
        
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
        stringRect = [self.text boundingRectWithSize:self.frame.size options:(NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:self.font} context:NULL].size;
#else
        stringRect = [self.text sizeWithFont:self.font
                           constrainedToSize:self.frame.size
                               lineBreakMode:NSLineBreakByWordWrapping];
#endif
    } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
        stringRect = [self.text boundingRectWithSize:maxSize options:(NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:self.font} context:NULL].size;
#else
        stringRect = [self.text sizeWithFont:self.font
                           constrainedToSize:maxSize
                               lineBreakMode:NSLineBreakByWordWrapping];
#endif
    }
    CGRect frame = self.frame;
    frame.size.width = stringRect.width;
    if (stringRect.height > frame.size.height) {
        frame.size.height = stringRect.height;
    }
    self.frame = frame;
    
    NSInteger lines = (int)stringRect.height / self.font.xHeight;
    self.numberOfLines = lines;
}

@end
