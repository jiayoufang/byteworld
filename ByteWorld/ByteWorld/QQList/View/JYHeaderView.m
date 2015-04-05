//
//  JYHeaderView.m
//  QQList
//
//  Created by fangjiayou on 15/4/5.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "JYHeaderView.h"

@implementation JYHeaderView
{
    UIButton *_arrowBtn;
    UILabel *_label;
}
+(instancetype)headerView:(UITableView *)tableView
{
    static NSString *identifier = @"header";
    JYHeaderView *header = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!header) {
        header = [[JYHeaderView alloc]initWithReuseIdentifier:identifier];
    }
    return header;
}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super init]) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"header_bg"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"header_bg_highlighted"] forState:UIControlStateHighlighted];
        [button setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //标题的内边距
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        button.imageView.contentMode = UIViewContentModeCenter;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.imageView.clipsToBounds = NO;//解决旋转变形问题
        _arrowBtn = button;
        [self.contentView addSubview:_arrowBtn];
        
        //创建label 显示在线人数
        UILabel *labelRight = [[UILabel alloc]init];
        labelRight.textAlignment = NSTextAlignmentCenter;
        _label = labelRight;
        [self.contentView addSubview:_label];
    }
    return self;
}

//复用tag
-(void)setTag:(NSInteger)tag
{
    [super setTag:tag];
    _arrowBtn.tag = tag;
}

#pragma mark-buttonAction
-(void)buttonAction:(UIButton*)btn
{
    self.groupModel.isOpen = !self.groupModel.isOpen;
    if ([self.delegate respondsToSelector:@selector(clickView:)]) {
        [self.delegate clickView:btn.tag];
    }
}

-(void)didMoveToSuperview
{
    _arrowBtn.imageView.transform = self.groupModel.isOpen ? CGAffineTransformMakeRotation(M_PI_2) : CGAffineTransformMakeRotation(0);
}

//设置frame值 布局
-(void)layoutSubviews
{
    [super layoutSubviews];
    _arrowBtn.frame = self.bounds;
    
    _label.frame = CGRectMake(CGRectGetWidth(self.bounds)-70, 0, 60, CGRectGetHeight(self.bounds));
}

//赋值
-(void)setGroupModel:(JYGroupModel *)groupModel
{
    _groupModel = groupModel;
    [_arrowBtn setTitle:_groupModel.name forState:UIControlStateNormal];
    _label.text = [NSString stringWithFormat:@"%@/%lu",_groupModel.online,(unsigned long)_groupModel.friends.count];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
