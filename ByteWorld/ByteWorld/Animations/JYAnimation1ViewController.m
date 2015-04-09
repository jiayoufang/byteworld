//
//  JYAnimaion1ViewController.m
//  ByteWorld
//
//  Created by 方 on 15/4/9.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "JYAnimation1ViewController.h"

@interface JYAnimation1ViewController ()

@property(nonatomic,strong) UILabel *label;

@end

@implementation JYAnimation1ViewController

#pragma mark-init
-(UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc]initWithFrame:CGRectMake(30, 300, 20, 20)];
        _label.backgroundColor = [UIColor redColor];
    }
    return _label;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.label];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 200, 200, 40);
    btn.backgroundColor = [UIColor cyanColor];
    [btn setTitle:@"转圈" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(circle:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)circle:(id)sender
{
    CGRect boundingRect = CGRectMake(0, 0, 130, 130);
    
    CAKeyframeAnimation *orbit = [CAKeyframeAnimation animation];
    orbit.keyPath = @"position";
    orbit.path = CFAutorelease(CGPathCreateWithEllipseInRect(boundingRect, NULL));
    orbit.duration = 4;
    orbit.additive = YES;
    orbit.repeatCount = HUGE_VALF;
    orbit.calculationMode = kCAAnimationPaced;
    orbit.rotationMode = /*kCAAnimationRotateAuto*/ nil;
    
    [self.label.layer addAnimation:orbit forKey:@"ani-track"];
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
