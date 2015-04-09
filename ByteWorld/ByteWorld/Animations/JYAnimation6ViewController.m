//
//  JYAnimation6ViewController.m
//  ByteWorld
//
//  Created by 方 on 15/4/9.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "JYAnimation6ViewController.h"

@interface JYAnimation6ViewController ()

@property(nonatomic,strong) UIView *layerView;

@end

@implementation JYAnimation6ViewController
{
    NSInteger tick;
}
#pragma mark-init
-(UIView *)layerView
{
    if (!_layerView) {
        _layerView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 200, 300)];
    }
    return _layerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    tick = 0;
    
    [self.view addSubview:self.layerView];
    
    UIImage *image = [UIImage imageNamed:@"Animation_Snowman"];
    self.layerView.layer.contents = (__bridge id)(image.CGImage);
    self.layerView.layer.contentsGravity = kCAGravityResizeAspect;
    self.layerView.layer.contentsScale = image.scale;
    [self performSelector:@selector(changeImage) withObject:nil afterDelay:0.25f];
}

-(void)addStretchableImage:(UIImage*)image withContentCenter:(CGRect)rect toLayer:(CALayer*)layer
{
    layer.contents = (__bridge id)(image.CGImage);
    layer.contentsCenter = rect;
}

-(void)changeImage
{
    UIImage *image = [UIImage imageNamed:@"Animation_Snowman"];
    
    CGRect rect = CGRectZero; if (tick > 5) tick = 0;
    
    switch (tick)
    {
        case 0:
            rect = CGRectMake(0, 0, 1, 0.75);
            break;
            
        case 1:
            rect = CGRectMake(0, 0, 1, 0.5);
            break;
            
        case 2:
            rect = CGRectMake(0, 0.25, 1, 0.5);
            break;
            
        case 3:
            rect = CGRectMake(0, 0.25, 1, 0.75);
            break;
            
        case 4:
            rect = CGRectMake(0, 0.5, 1, 1);
            break;
            
        case 5:
            rect = CGRectMake(0, 0.25, 1, 1);
            break;
            
        default:
            rect = CGRectMake(0, 0, 1, 1);
            break;
    }
    
    tick++;
    
    [self addStretchableImage:image withContentCenter:rect toLayer:self.layerView.layer];
    
    [self performSelector:@selector(changeImage) withObject:nil afterDelay:0.1];
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
