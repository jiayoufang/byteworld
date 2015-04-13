//
//  JYButtonViewController.m
//  ByteWorld
//
//  Created by 方 on 15/4/10.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "JYButtonViewController.h"
#import "JYButton.h"

@interface JYButtonViewController ()

@end

@implementation JYButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    JYButton *btn = [JYButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 100, 200, 30);
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
//    btn.backgroundColor = [UIColor blueColor];
    [btn setBackgroundColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    [self.view addSubview:btn];
    
    
    
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
