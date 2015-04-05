//
//  JYLockViewController.m
//  ByteWorld
//
//  Created by fangjiayou on 15/4/5.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "JYLockViewController.h"
#import "JYLockView.h"
@interface JYLockViewController ()<JYLockViewDelegate>

@property(nonatomic,strong) JYLockView *lockView;

@end

@implementation JYLockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //添加背景图片
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = self.view.bounds;
    imageView.image = [UIImage imageNamed:@"Home_refresh_bg"];
    [self.view addSubview:imageView];
    
    [self.view addSubview:self.lockView];
    
}

-(JYLockView*)lockView
{
    if (!_lockView) {
        _lockView = [[JYLockView alloc]initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.bounds), CGRectGetWidth(self.view.bounds))];
        _lockView.delegate = self;
    }
    return _lockView;
}

#pragma mark- JYLockViewDelegate
-(void)lockView:(JYLockView *)lockView didFinishPath:(NSString *)path
{
    if ([path isEqualToString:@"012345678"]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"密码正确" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            
        }]];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"密码错误" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            
        }]];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
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
