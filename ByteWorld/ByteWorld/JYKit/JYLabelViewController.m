//
//  JYLabelViewController.m
//  ByteWorld
//
//  Created by 方 on 15/4/10.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "JYLabelViewController.h"
#import "JYLabel.h"
#import "UILabel+Additions.h"
#import "UILabel+VerticalAlignment.h"
#import "UILabel+AutomaticWriting.h"

/*
 1、设置自定义字体http://www.jianshu.com/p/d728570bdf7b
 
 */
@interface JYLabelViewController ()

@end

@implementation JYLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 300, 300)];
//    label.text = @"Label自适应Label自适应Label自适应Label自适应Label自适应Label自适应Label自适应Label自适应Label自适应Label自适应自适应自适应自适应自适应自适应Label自适应Label自适应Label自适应Label自适应Label自适应";
//    [label adjustFontWithMaxSize:CGSizeMake(300, MAXFLOAT)];
    label.textColor = [UIColor blueColor];
    label.textAlignment = NSTextAlignmentLeft;
    label.backgroundColor = [UIColor orangeColor];
//    label.font = [UIFont fontWithName:@"MComicHK-Medium" size:30];
    [self.view addSubview:label];
    
    [label setText:@"适应Label自适应Label自适应自适应自适应自适应自适应自适应Label自适应Label自适应Label自适应Label自适应Label自适应" automaticWritingAnimationWithDuration:0.13f blinkingMode:UILabelAWBlinkingModeUntilFinish blinkingCharacter:2 completion:^{
        
    }];
//    [label setText:@"啊；地方哦啊是否能拉丝" automaticWritingAnimationWithDuration:0.13f];
    NSLog(@"frame = %@",NSStringFromCGRect(label.frame));
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
