//
//  JYHoledViewController.m
//  ByteWorld
//
//  Created by fangjiayou on 15/4/12.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "JYHoledViewController.h"
#import "JMHoledView.h"

@interface JYHoledViewController ()<JMHoledViewDelegate>

@property(nonatomic,strong) JMHoledView *holedView;

@end

@implementation JYHoledViewController

#pragma mark -init
-(JMHoledView*)holedView
{
    if (!_holedView) {
        _holedView = [[JMHoledView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _holedView.delegate = self;
    }
    return _holedView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    [self.view addSubview:self.holedView];
    
    [self setupHoledView];
}

//创建提示语
-(void)setupHoledView
{
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(100, 100, 150, 30);
//    [btn setTitle:@"提示1" forState:UIControlStateNormal];
////    btn.backgroundColor = [UIColor whiteColor];
////    [btn setBackgroundImage:[UIImage imageNamed:@"tabbar1_selected"] forState:UIControlStateNormal];
//    [self.holedView addSubview:btn];
    [self.holedView addHoleCircleCenteredOnPosition:CGPointMake(25.0f, 45.0f) andDiameter:70.0f];
    
    [self.holedView addHoleRoundedRectOnRect:CGRectMake(5.0f, 250.0f, 100.0f, 30.0f) withCornerRadius:10.0f];
    
    [self.holedView addHCustomView:[self viewForDemo] onRect:CGRectMake(60.0f, 350.0f, 200.0f, 50.0f)];
}

#pragma mark-JMHoledViewDelegate
-(void)holedView:(JMHoledView *)holedView didSelectHoleAtIndex:(NSUInteger)index
{
    NSLog(@"%s 提示被点击==》%zd",__PRETTY_FUNCTION__,index);
}
- (UIView *)viewForDemo
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 350.0F, 200.0f, 50.0f)];
    [label setBackgroundColor:[UIColor clearColor]];
    label.layer.borderColor = [UIColor whiteColor].CGColor;
    label.layer.borderWidth = 1.0f;
    label.layer.cornerRadius = 10.0f;
    [label setTextColor:[UIColor whiteColor]];
    label.text = @"This control can be use to Highlight informations.";
    label.numberOfLines = 2;
    label.font = [UIFont systemFontOfSize:14.0f];
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
