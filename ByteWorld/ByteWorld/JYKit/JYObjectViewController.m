//
//  JYObjectViewController.m
//  ByteWorld
//
//  Created by 方 on 15/4/13.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "JYObjectViewController.h"
#import "NSObject+JYRuntime.h"

@interface JYObjectViewController ()<UIScrollViewDelegate>

@end

@implementation JYObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@",[self conformedProtocols]);
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
