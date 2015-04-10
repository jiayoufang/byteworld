//
//  JYAnimation0ViewController.m
//  ByteWorld
//
//  Created by 方 on 15/4/9.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "JYAnimation0ViewController.h"

@interface JYAnimation0ViewController ()

//抖动的视图
@property(nonatomic,strong) UITextField *textField;

@end

@implementation JYAnimation0ViewController

#pragma mark-init
-(UITextField*)textField
{
    if (!_textField) {
        _textField = [[UITextField alloc]initWithFrame:CGRectMake(100, 100, 200, 30)];
//        _textField.borderStyle = UITextBorderStyleRoundedRect;
        _textField.clipsToBounds = YES;
        _textField.layer.masksToBounds = YES;
        _textField.layer.borderWidth = 1.0f;
        _textField.layer.cornerRadius = 5.0f;
        _textField.layer.borderColor = [UIColor redColor].CGColor;
    }
    return _textField;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.textField];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 200, 200, 40);
    btn.backgroundColor = [UIColor cyanColor];
    [btn setTitle:@"震动" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(shake:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)shake:(id)sender
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values = @[ @0, @10, @-10, @10, @0 ];
    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    animation.duration = 0.4;
    
    animation.additive = YES;
    
    [self.textField.layer addAnimation:animation forKey:@"shake11"];
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
