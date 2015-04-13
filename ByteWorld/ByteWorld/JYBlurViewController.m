//
//  JYBlurViewController.m
//  ByteWorld
//
//  Created by 方 on 15/4/10.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "JYBlurViewController.h"
#import "FXBlurView.h"
@interface JYBlurViewController ()

@property(nonatomic,strong) UIImageView *backgroundImageView;
@property(nonatomic,strong) FXBlurView *blurView;

@end

@implementation JYBlurViewController

#pragma mark -init
-(UIImageView*)backgroundImageView
{
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
        _backgroundImageView.image = [UIImage imageNamed:@"animation_pic2"];
    }
    return _backgroundImageView;
}

-(FXBlurView*)blurView
{
    if (!_blurView) {
        _blurView = [[FXBlurView alloc]initWithFrame:self.view.bounds];
//        _blurView.blurEnabled = NO;
//        _blurView.dynamic = NO;//是否颤抖
        
//        _blurView.contentMode = UIViewContentModeBottom;
        
//        UIImageView *imageView = [[UIImageView alloc]initWithFrame:_blurView.bounds];
//        imageView.image = [UIImage imageNamed:@"overlay"];
//        [_blurView addSubview:imageView];
    }
    return _blurView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.backgroundImageView];
    [self.view addSubview:self.blurView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 50, 200, 40);
    btn.backgroundColor = [UIColor cyanColor];
    [btn setTitle:@"效果" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(present:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(100, 150, 200, 40);
    btn1.backgroundColor = [UIColor cyanColor];
    [btn1 setTitle:@"效果1" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(present1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(100, 250, 200, 40);
    btn2.backgroundColor = [UIColor cyanColor];
    [btn2 setTitle:@"效果2" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(present2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    //设置初始位置，使其不可见
    [self.blurView updateAsynchronously:YES completion:^{
        self.blurView.frame = CGRectMake(0, 568, 320, 0);
    }];
}

-(void)present:(id)sender
{
//    self.blurView.blurEnabled = self.blurView.blurEnabled ? NO:YES;
//    UIPresentationController *present = [[UIPresentationController alloc]init];
//    [self presentViewController:present animated:YES completion:nil];
    if (self.blurView.blurRadius < 5)
    {
        [UIView animateWithDuration:0.5 animations:^{
            self.blurView.blurRadius = 40;//透明度
        }];
    }
    else
    {
        [UIView animateWithDuration:0.5 animations:^{
            self.blurView.blurRadius = 0;
        }];
    }
}
-(void)present1:(id)sender
{
    
}

-(void)present2:(id)sender
{
    [UIView animateWithDuration:0.5 animations:^{
        BOOL open = self.blurView.frame.size.height > 200;
        self.blurView.frame = CGRectMake(0, open? CGRectGetHeight(self.view.bounds): (CGRectGetHeight(self.view.bounds)-425), CGRectGetWidth(self.view.bounds), open? 0: 425);
    }];
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
