//
//  JYAnimation2ViewController.m
//  ByteWorld
//
//  Created by 方 on 15/4/9.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "JYAnimation2ViewController.h"

@interface JYAnimation2ViewController ()

@property(nonatomic,strong) UIImageView *imageViewOne;
@property(nonatomic,strong) UIImageView *imageViewTwo;
@property(nonatomic,strong) CAShapeLayer *shapeLayer;
@property(nonatomic,strong) UIBezierPath *bezierPath;

@end

@implementation JYAnimation2ViewController
{
    NSInteger _zIndicator;
}
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
    
    _zIndicator = 1;
    
    [self.view addSubview:self.imageViewOne];
    [self.view addSubview:self.imageViewTwo];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 300, 200, 40);
    btn.backgroundColor = [UIColor cyanColor];
    [btn setTitle:@"交换" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(exchange:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)exchange:(id)sender
{
    _zIndicator = -_zIndicator;
    
    // Animation group for cardA
    CABasicAnimation *zPosition = [CABasicAnimation animation];
    zPosition.keyPath = @"zPosition";
    zPosition.fromValue = @(_zIndicator);
    zPosition.toValue = @(-_zIndicator);
    zPosition.duration = 1.2;
    
    CAKeyframeAnimation *rotation = [CAKeyframeAnimation animation];
    rotation.keyPath = @"transform.rotation";
    rotation.values = @[ @0, @0.14, @0 ];
    rotation.duration = 1.2;
    rotation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    CAKeyframeAnimation *position = [CAKeyframeAnimation animation];
    position.keyPath = @"position";
    position.values = @[[NSValue valueWithCGPoint:CGPointZero],
                        [NSValue valueWithCGPoint:CGPointMake(90, -20)],
                        [NSValue valueWithCGPoint:CGPointZero]];
    position.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    position.additive = YES;
    position.duration = 1.2;
    
    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
    group.animations = @[ zPosition, rotation, position ];
    group.duration = 1.2;
    
    self.imageViewOne.layer.zPosition = -_zIndicator;
    [self.imageViewOne.layer addAnimation:group forKey:@"shuffle"];
    
    // Animation group for cardB
    CABasicAnimation *zPosition1 = [CABasicAnimation animation];
    zPosition1.keyPath = @"zPosition";
    zPosition1.fromValue = @(-_zIndicator);
    zPosition1.toValue = @(_zIndicator);
    zPosition1.duration = 1.2;
    
    CAKeyframeAnimation *rotation1 = [CAKeyframeAnimation animation];
    rotation1.keyPath = @"transform.rotation";
    rotation1.values = @[ @0, @(-0.14), @0 ];
    rotation1.duration = 1.2;
    rotation1.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    CAKeyframeAnimation *position1 = [CAKeyframeAnimation animation];
    position1.keyPath = @"position";
    position1.values = @[[NSValue valueWithCGPoint:CGPointZero],
                         [NSValue valueWithCGPoint:CGPointMake(-85, -20)],
                         [NSValue valueWithCGPoint:CGPointZero]];
    position1.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    position1.additive = YES;
    position1.duration = 1.2;
    
    CAAnimationGroup *group1 = [[CAAnimationGroup alloc] init];
    group1.animations = @[ zPosition1, rotation1, position1 ];
    group1.duration = 1.2;
    
    self.imageViewTwo.layer.zPosition = _zIndicator;
    [self.imageViewTwo.layer addAnimation:group1 forKey:@"shuffle"];
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
