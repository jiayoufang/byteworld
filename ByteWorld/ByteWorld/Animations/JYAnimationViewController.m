//
//  JYAnimationViewController.m
//  ByteWorld
//
//  Created by 方 on 15/4/9.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "JYAnimationViewController.h"

@interface JYAnimationViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSArray *dataArray;

@end

@implementation JYAnimationViewController

#pragma mark-init
-(UITableView*)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [[UIView alloc]init];
    }
    return _tableView;
}

-(NSArray *)dataArray
{
    if (!_dataArray) {
        _dataArray  = @[@{@"左右震动":@"视图左右抖动的实现"},@{@"转圈":@"视图做圆周运动"},@{@"交换位置":@"两张卡片交换位置"},@{@"文字动画":@"根据坐标拼各种形状展示"},@{@"平滑移动":@"平行方位的移动&&将图像改变为圆形（也可根据不同的贝塞尔曲线变为各种形状）"},@{@"翻转":@"3D旋转&2D"}];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"动画";
    
    [self.view addSubview:self.tableView];
}

#pragma mark-UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"identify";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identify];
    }
    NSDictionary *dict = [self.dataArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [[dict allKeys]firstObject];
    cell.detailTextLabel.text = [[dict allValues]firstObject];
    return cell;
}

#pragma mark-UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc = [[NSClassFromString([NSString stringWithFormat:@"JYAnimation%zdViewController",indexPath.row]) alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
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
