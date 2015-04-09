//
//  JYAnimation4ViewController.m
//  ByteWorld
//
//  Created by 方 on 15/4/9.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "JYAnimation4ViewController.h"

@interface JYAnimation4ViewController ()

@property(nonatomic,strong) UIImageView *imageView;

@end

@implementation JYAnimation4ViewController

#pragma mark-init
-(UIImageView*)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(50, 100, 200, 300)];
        _imageView.image = [UIImage imageNamed:@"animation_head"];
    }
    return _imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.imageView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 200, 200, 40);
    btn.backgroundColor = [UIColor cyanColor];
    [btn setTitle:@"变圆形" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(shapeLayerDisplay:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(100, 400, 200, 40);
    btn1.backgroundColor = [UIColor cyanColor];
    [btn1 setTitle:@"移动" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(presentationLayerDis:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
}

//变圆形
-(void)shapeLayerDisplay:(id)sender
{
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(70, 70) radius:50.0f startAngle:0 endAngle:M_PI*2 clockwise:YES];
    CAShapeLayer *shaper = [CAShapeLayer layer];
    shaper.path = path.CGPath;
    self.imageView.layer.mask = shaper;
}

//移动
-(void)presentationLayerDis:(id)sender
{
    NSNumber *toValue = @423.5;
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.y";
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.duration = 1;
    animation.fromValue = @([self.imageView.layer.presentationLayer position].y);
    animation.toValue = toValue;
    //最后要设置位置，不然又回去了
    self.imageView.layer.position = CGPointMake(self.imageView.layer.position.x, [toValue intValue]);
    
    NSString *key = [NSString stringWithFormat:@"ani-move"];
    [self.imageView.layer addAnimation:animation forKey:key];
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
