//
//  JYStringViewController.m
//  ByteWorld
//
//  Created by fangjiayou on 15/4/19.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "JYStringViewController.h"
#import "NSString+JYString.h"

@interface JYStringViewController ()

@end

@implementation JYStringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"我的 = %@",[@"我的" transformFromChinese]);
    
    [self sort];
}

//字符串排序
-(void)sort
{
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"k",@"H",@"Ka",@"#",@"b",@"A",@"Kb",@"%",@"我的",@"啊", nil];
    NSMutableArray *tmp = [NSMutableArray array];
    for (NSString *str in array) {
        [tmp addObject:[str transformFromChinese]];
    }
//    NSArray *tmp = [array sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
//    NSEnumerator *en = [tmp objectEnumerator];
    [tmp sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    NSEnumerator *en = [tmp objectEnumerator];
    id str;
    while ((str = [en nextObject])!=nil) {
        NSLog(@"str = %@",str);
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
