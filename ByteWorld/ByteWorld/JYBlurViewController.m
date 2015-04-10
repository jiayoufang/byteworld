//
//  JYBlurViewController.m
//  ByteWorld
//
//  Created by 方 on 15/4/10.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "JYBlurViewController.h"

@interface JYBlurViewController ()

@end

@implementation JYBlurViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 200, 200, 40);
    btn.backgroundColor = [UIColor cyanColor];
    [btn setTitle:@"弹出" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(present:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)present:(id)sender
{
//    UIPresentationController *present = [[UIPresentationController alloc]init];
//    [self presentViewController:present animated:YES completion:nil];
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
