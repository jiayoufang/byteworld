//
//  JYIntrolViewController.m
//  ByteWorld
//
//  Created by fangjiayou on 15/4/12.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "JYIntrolViewController.h"
#import "JYIntrolView.h"

@interface JYIntrolViewController ()<JYIntrolViewDelegate>

@property(nonatomic,strong) JYIntrolView *introlView;

@end

@implementation JYIntrolViewController

-(JYIntrolView*)introlView
{
    if (!_introlView) {
        _introlView = [[JYIntrolView alloc]initWithFrame:self.view.bounds];
        _introlView.delegate = self;
    }
    return _introlView;
}

-(void)finishedButtonClick
{
    [UIView animateWithDuration:.8f delay:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.introlView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [self.introlView removeFromSuperview];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.introlView];
    
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
