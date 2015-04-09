//
//  JYAnimation5ViewController.m
//  ByteWorld
//
//  Created by 方 on 15/4/9.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "JYAnimation5ViewController.h"

@interface JYAnimation5ViewController ()

@property(nonatomic,strong) UIImageView *imageViewOne;
@property(nonatomic,strong) UIImageView *imageViewTwo;

@end

@implementation JYAnimation5ViewController

-(UIImageView*)imageViewOne
{
    if (!_imageViewOne) {
        _imageViewOne = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 150)];
        //        _imageViewOne.backgroundColor = [UIColor orangeColor];
        _imageViewOne.image = [UIImage imageNamed:@"animation_pic1"];
    }
    return _imageViewOne;
}

-(UIImageView*)imageViewTwo
{
    if (!_imageViewTwo) {
        _imageViewTwo = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 150)];
        //        _imageViewTwo.backgroundColor = [UIColor cyanColor];
        _imageViewTwo.image = [UIImage imageNamed:@"animation_pic2"];
    }
    return _imageViewTwo;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.imageViewOne];
    
    //可配合使用构造出不同的效果
    
    NSArray *actionArray = @[@"kitRotateAction:",@"caRotateAction:",@"XRotateAction:",@"YRotateAction:"];
    
    for (int i = 0; i<actionArray.count; i++) {
        CGFloat x =  10+180*(i%2);
        CGFloat y = 400+50*(i/2);
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(x, y, 170, 30);
        btn.backgroundColor = [UIColor cyanColor];
        [btn setTitle:actionArray[i] forState:UIControlStateNormal];
        [btn addTarget:self action:NSSelectorFromString(actionArray[i]) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}


- (void)kitRotateAction:(id)sender
{
    [UIView animateWithDuration:1.f animations:^
     {
         self.imageViewOne.transform = CGAffineTransformMakeRotation(M_PI/2);
     }
                     completion:^(BOOL finished)
     {
         self.imageViewOne.transform = CGAffineTransformIdentity;
     }];
}

- (void)caRotateAction:(id)sender
{
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    
    rotation.fromValue = @(0); rotation.toValue = @(M_PI*2);
    rotation.duration = 1.f; rotation.repeatCount = /*INFINITY*/ 1;
    
    rotation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    // rotation.fillMode = kCAFillModeForwards;
    // rotation.removedOnCompletion = NO;
    
    self.imageViewOne.transform = CGAffineTransformMakeRotation(M_PI*2);
    
    [self.imageViewOne.layer addAnimation:rotation forKey:@"an_roate"];
}

- (void)XRotateAction:(id)sender
{
    CABasicAnimation *TransformAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    TransformAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    TransformAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 1, 0, 0)];
    
    TransformAnim.cumulative = YES; TransformAnim.duration = 3; TransformAnim.repeatCount = 2;
    
    [self.imageViewOne.layer addAnimation:TransformAnim forKey:nil];
}

- (void)YRotateAction:(id)sender
{
    CABasicAnimation *TransformAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    TransformAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    TransformAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 1, 0)];
    
    TransformAnim.cumulative = YES; TransformAnim.duration = 3; TransformAnim.repeatCount = 2;
    
    [self.imageViewOne.layer addAnimation:TransformAnim forKey:nil];
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
