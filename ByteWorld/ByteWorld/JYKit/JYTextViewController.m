//
//  JYTextViewController.m
//  ByteWorld
//
//  Created by fangjiayou on 15/4/12.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "JYTextViewController.h"
#import "JYTextView.h"

@interface JYTextViewController ()

//可以添加缺省值
@property(nonatomic,strong) JYTextView *textView;

@end

@implementation JYTextViewController

#pragma mark - init
-(JYTextView*)textView
{
    if (!_textView) {
        _textView = [[JYTextView alloc]initWithFrame:CGRectMake(10, 10, 200, 80)];
        [_textView setBackgroundColor:[UIColor greenColor]];
    }
    return _textView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.textView];
    
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
