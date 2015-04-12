//
//  JYTextView.m
//  ByteWorld
//
//  Created by fangjiayou on 15/4/12.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "JYTextView.h"

@implementation JYTextView
{
    UILabel *placeholderLabel;
}

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self awakeFromNib];
    }
    return self;
}

-(void)awakeFromNib
{
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(didTextChanaged:) name:UITextViewTextDidChangeNotification object:self];
    float left = 5,top = 2,height = 30;
    
    //    self.placeholderColor = [UIColor lightGrayColor];
    
    placeholderLabel = [[UILabel alloc]initWithFrame:CGRectMake(left, top, CGRectGetWidth(self.frame)-2*left, height)];
    [placeholderLabel setFont:(self.placeholderFont?self.placeholderFont:self.font)];
    [placeholderLabel setTextColor:(self.placeholderColor?self.placeholderColor:[UIColor lightGrayColor])];
    [placeholderLabel setText:(self.placeholder?self.placeholder:@"还未填写placeholder")];
    [self addSubview:placeholderLabel];
}

-(void)setPlaceholder:(NSString *)placeholder
{
    if (placeholder.length == 0||[placeholder isEqualToString:@""]) {
        placeholderLabel.hidden = YES;
    }
    else
    {
        [placeholderLabel setText:placeholder];
    }
    _placeholder = placeholder;
}

-(void)didTextChanaged:(NSNotification*)noti
{
    if (self.placeholder.length == 0||[self.placeholder isEqualToString:@""]) {
        placeholderLabel.hidden = YES;
    }
    if (self.text.length > 0) {
        placeholderLabel.hidden = YES;
    }else
    {
        placeholderLabel.hidden = NO;
    }
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [placeholderLabel removeFromSuperview];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
