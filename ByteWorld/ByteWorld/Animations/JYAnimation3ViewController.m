//
//  JYAnimation3ViewController.m
//  ByteWorld
//
//  Created by 方 on 15/4/9.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "JYAnimation3ViewController.h"

@interface JYAnimation3ViewController ()

@property(nonatomic,strong) CAShapeLayer *animationLayer;

@end

@implementation JYAnimation3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 200, 200, 40);
    btn.backgroundColor = [UIColor cyanColor];
    [btn setTitle:@"划线" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(startAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)setupAnimationLayer
{
    [self.animationLayer removeFromSuperlayer]; self.animationLayer = nil;
    
    CGPoint bottomLeft 	= CGPointMake(35.f, 400.f);
    CGPoint topLeft		= CGPointMake(35.f, 200.f);
    CGPoint bottomRight = CGPointMake(285.f, 400.f);
    CGPoint topRight	= CGPointMake(285.f, 200.f);
    CGPoint roofTip		= CGPointMake(160.f, 100.f);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:bottomLeft];
    [path addLineToPoint:topLeft];
    [path addLineToPoint:roofTip];
    [path addLineToPoint:topRight];
//    [path moveToPoint:roofTip];
    [path addLineToPoint:topLeft];
    [path addLineToPoint:bottomRight];
    [path addLineToPoint:topRight];
    [path addLineToPoint:bottomLeft];
    [path addLineToPoint:bottomRight];
    
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.frame = CGRectMake(35, 100, 250, 200);
    pathLayer.bounds = CGRectMake(35, 100, 250, 200);
    pathLayer.path = path.CGPath;
    pathLayer.strokeColor = [[UIColor blackColor] CGColor];
    pathLayer.fillColor = nil;
    pathLayer.lineWidth = 6.f;
    pathLayer.lineJoin = kCALineJoinRound;
    
    [self.view.layer addSublayer:pathLayer];
    [self setAnimationLayer:pathLayer];
}

- (void)startAnimation:(id)sender
{
    [self setupAnimationLayer];
    
    [self.animationLayer removeAllAnimations];
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 10.0;
    pathAnimation.fromValue = @(0);
    pathAnimation.toValue = @(1);
    [self.animationLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
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
