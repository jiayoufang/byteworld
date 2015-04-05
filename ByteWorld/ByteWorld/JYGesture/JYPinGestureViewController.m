//
//  JYPinGestureViewController.m
//  ByteWorld
//
//  Created by fangjiayou on 15/4/5.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "JYPinGestureViewController.h"

@interface JYPinGestureViewController ()

@end

@implementation JYPinGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(100, 100, 200, 30);
    label.backgroundColor = [UIColor cyanColor];
    label.text = @"测试点击手势";
    label.userInteractionEnabled = YES;
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    //单击一个手指
    UITapGestureRecognizer *tapSingleOneFinger  = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapSingleOneFinger:)];
    tapSingleOneFinger.numberOfTapsRequired = 1;
    tapSingleOneFinger.numberOfTouchesRequired = 1;
    [label addGestureRecognizer:tapSingleOneFinger];
    
    //双击一个手指
    UITapGestureRecognizer *tapDoubleOneFinger = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapDoubleOneFinger:)];
    tapDoubleOneFinger.numberOfTapsRequired = 2;
    tapDoubleOneFinger.numberOfTouchesRequired = 1;
    [label addGestureRecognizer:tapDoubleOneFinger];
    //如果有第二个手势则第一个手势失效
    [tapSingleOneFinger requireGestureRecognizerToFail:tapDoubleOneFinger];
    
    //从右向左
    UISwipeGestureRecognizer *swipeGes = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeAction:)];
    swipeGes.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeGes];
    
    //缩放
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchAction:)];
    [self.view addGestureRecognizer:pinch];
    
//    UIRotationGestureRecognizer
//    UILongPressGestureRecognizer
//    UIPanGestureRecognizer
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [label addGestureRecognizer:pan];
    
}

-(void)pan:(UIPanGestureRecognizer*)pan
{
    //移动的坐标值
    CGPoint translation = [pan translationInView:self.view];
    //移动后的坐标
    pan.view.center = CGPointMake(pan.view.center.x + translation.x, pan.view.center.y + translation.y);
    [pan setTranslation:CGPointZero inView:self.view];
}

-(void)tapSingleOneFinger:(UITapGestureRecognizer*)tap
{
    NSLog(@"单击一个手指");
}

-(void)tapDoubleOneFinger:(UITapGestureRecognizer*)tap
{
    NSLog(@"双击一个手指");
}

-(void)tapSingleTwoFingers:(UITapGestureRecognizer*)tap
{
    NSLog(@"单击两个手指");
}

-(void)swipeAction:(UISwipeGestureRecognizer*)swipeGes
{
    NSLog(@"UISwipeGestureRecognizerDirectionLeft");
    float scale = 0.8;

    [UIView animateWithDuration:1.0f animations:^{
        swipeGes.view.transform = CGAffineTransformScale(swipeGes.view.transform, scale, scale);
        if (scale > 1) {
            NSLog(@"放大");
        }else{
            NSLog(@"缩小");
        }
    } completion:^(BOOL finished) {
        
    }];
}

-(void)pinchAction:(UIPinchGestureRecognizer*)pinch
{
    float scale = pinch.scale;
    pinch.view.transform = CGAffineTransformScale(pinch.view.transform, scale, scale);
    if (scale > 1) {
        NSLog(@"放大");
    }else{
        NSLog(@"缩小");
    }
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
