//
//  JYViewController.m
//  ByteWorld
//
//  Created by 方 on 15/4/13.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "JYViewController.h"
#import "UIView+JYScreenView.h"

@interface JYViewController ()

@property(nonatomic,strong) UIImageView *imageView;

@end

@implementation JYViewController

-(UIImageView*)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    }
    return _imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"Intro_Screen_One"];
    [self.view addSubview:imageView];
    
    [self.view addSubview:self.imageView];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.imageView.image = [self.view screenImage];
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
