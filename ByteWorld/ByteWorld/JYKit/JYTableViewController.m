//
//  JYTableViewController.m
//  ByteWorld
//
//  Created by 方 on 15/4/9.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "JYTableViewController.h"
#import "UINavigationBar+JYBackgroundColor.h"

CGFloat const ImgWidth = 828;
CGFloat const ImgHeight = 589;
#define ScaleImageViewHeight ([UIScreen mainScreen].bounds.size.width)*ImgHeight/ImgWidth

#define NAVBAR_CHANGE_POINT -70

@interface JYTableViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSMutableArray *dataArray;

@property(nonatomic,strong) UIImageView *scaleImageView;
@property(nonatomic,strong) UIImageView *noScaleImage;

@end

@implementation JYTableViewController

#pragma mark-init
-(UITableView*)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.contentInset = UIEdgeInsetsMake(ScaleImageViewHeight, 0, 0, 0);
        _tableView.tableFooterView = [[UIView alloc]init];
    }
    return _tableView;
}

-(NSArray*)dataArray
{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc]initWithArray: @[@"UITableView",@"UITableView",@"UITableView",@"UITableView",@"UITableView",@"UITableView",@"UITableView",@"UITableView",@"UITableView",@"UITableView",@"UITableView",@"UITableView",@"UITableView",@"UITableView",@"UITableView",@"UITableView",@"UITableView",@"UITableView",@"UITableView",@"UITableView",@"UITableView",@"UITableView",@"UITableView",@"UITableView",@"UITableView"]];
    }
    return _dataArray;
}

-(UIImageView*)scaleImageView
{
    if (!_scaleImageView) {
        _scaleImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -ScaleImageViewHeight, self.view.bounds.size.width, ScaleImageViewHeight)];
        [_scaleImageView setImage:[UIImage imageNamed:@"animation_head"]];
    }
    return _scaleImageView;
}

-(UIImageView*)noScaleImage
{
    if (!_noScaleImage) {
        _noScaleImage = [[UIImageView alloc]initWithFrame:CGRectMake(20, -50, 48, 48)];
        [_noScaleImage setImage:[UIImage imageNamed:@"Animation_Snowman"]];
    }
    return _noScaleImage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.tableView addSubview:self.scaleImageView];
    [self.tableView addSubview:self.noScaleImage];
    [self.view addSubview:self.tableView];
}

#pragma mark-UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //将tabelview分割线不靠左(未补全)问题
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark-UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat y = scrollView.contentOffset.y;
    if (y < -ScaleImageViewHeight)
    {
        CGRect frame = self.scaleImageView.frame;
        frame.size.height = -y;
        frame.origin.y = y;
        self.scaleImageView.frame = frame;
    }
    
#if 1
    //第一种方式
    UIColor * color = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1];
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > NAVBAR_CHANGE_POINT) {
        CGFloat alpha = 1 - ((NAVBAR_CHANGE_POINT + 64 - offsetY) / 64);
        
        [self.navigationController.navigationBar jy_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
    } else {
        [self.navigationController.navigationBar jy_setBackgroundColor:[color colorWithAlphaComponent:0]];
    }
#else
    //第二种方式
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > 0) {
        if (offsetY >= 44) {
            [self setNavigationBarTransformProgress:1];
        } else {
            [self setNavigationBarTransformProgress:(offsetY / 44)];
        }
    } else {
        [self setNavigationBarTransformProgress:0];
        self.navigationController.navigationBar.backIndicatorImage = [UIImage new];
    }
#endif
}

- (void)setNavigationBarTransformProgress:(CGFloat)progress
{
    [self.navigationController.navigationBar jy_setTranslationY:(-44 * progress)];
    [self.navigationController.navigationBar jy_setContentAlpha:(1-progress)];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar jy_reset];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    //解决了滑动状态下返回上一页程序崩溃的问题
    self.tableView.dataSource = nil;
    self.tableView.delegate = nil;
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
