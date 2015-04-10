//
//  JYTabbarViewController.m
//  ByteWorld
//
//  Created by 方 on 15/3/31.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "JYTabbarViewController.h"
#import "JYTabBar1ViewController.h"
#import "JYTabBar2ViewController.h"
#import "JYTabBar3ViewController.h"
#import "JYTabBar4ViewController.h"
#import "JSBadgeView.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define EACH_W(A) ([UIScreen mainScreen].bounds.size.width/A)

CGFloat const tabViewHeight = 49;
CGFloat const btnWidth = 110;
CGFloat const btnHeight = 45;

@interface JYTabbarViewController ()

@property(nonatomic,strong) UIImageView *selectView;
@property(nonatomic,strong) NSMutableArray *tabBarViewControllers;
@property(nonatomic,strong) UIButton *lastSelectButton;
@end

@implementation JYTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //隐藏系统默认的样式
    self.tabBar.hidden = YES;
    
    [self initViewControllers];
    [self initTabBarView];
}

#pragma mark -private
///初始化viewControllers
-(NSMutableArray*)tabBarViewControllers
{
    if (!_tabBarViewControllers) {
        _tabBarViewControllers = [NSMutableArray array];
    }
    return _tabBarViewControllers;
}

///初始化箭头
-(UIImageView*)selectView
{
    if (!_selectView) {
        _selectView = [[UIImageView alloc]init];
        _selectView.image = [UIImage imageNamed:@"home_bottom_tab_arrow"];
//        _selectView.backgroundColor = [UIColor blueColor];
        _selectView.bounds = CGRectMake(0, 0, 32, 23);
        _selectView.center = CGPointMake(btnWidth*0.5, 5);
    }
    return _selectView;
}

//初始化视图控制器
-(void)initViewControllers
{
    JYTabBar1ViewController *tabBar1ViewController = [[JYTabBar1ViewController alloc]init];
    JYTabBar2ViewController *tabBar2ViewController = [[JYTabBar2ViewController alloc]init];
    JYTabBar3ViewController *tabBar3ViewController = [[JYTabBar3ViewController alloc]init];
    JYTabBar4ViewController *tabBar4ViewController = [[JYTabBar4ViewController alloc]init];
    NSArray *array = @[tabBar1ViewController,tabBar2ViewController,tabBar3ViewController,tabBar4ViewController];
    
    for (int i = 0; i<array.count; i++) {
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:array[i]];
        [self.tabBarViewControllers addObject:nav];
    }
    self.viewControllers = self.tabBarViewControllers;
}

//自定义标签工具栏
-(void)initTabBarView
{
    _tabBarView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight-tabViewHeight, kScreenWidth, tabViewHeight)];
    _tabBarView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backcolor"]];
    [self.view addSubview:_tabBarView];
    for (int i = 0; i<self.viewControllers.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"tabbar%zd",i+1]] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"tabbar%zd_selected",i+1]] forState:UIControlStateSelected];
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"tabbar%zd_selected",i+1]] forState:UIControlStateHighlighted];
        btn.frame = CGRectMake(EACH_W(self.viewControllers.count) * i, (tabViewHeight-btnHeight)*0.5, EACH_W(self.viewControllers.count), btnHeight);
        btn.tag = 100+i;
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        JSBadgeView *badgeView = [[JSBadgeView alloc]initWithParentView:btn alignment:JSBadgeViewAlignmentTopRight];
        badgeView.badgeText = [NSString stringWithFormat:@"%d",i+96];
        
        [self.tabBarView addSubview:btn];
        if (0 == i) {
            btn.selected = YES;
            self.lastSelectButton = btn;
        }
    }
    
    [self.tabBarView addSubview:self.selectView];
    
    [self.view addSubview:self.tabBarView];
}

-(void)btnAction:(UIButton*)btn
{
    //设置显示的解密那
    self.selectedIndex = btn.tag - 100;
    //设置选中样式
    self.lastSelectButton.selected = NO;
    btn.selected = YES;
    self.lastSelectButton = btn;
    
    [UIView animateWithDuration:0.2f animations:^{
        self.selectView.center = btn.center;
    } completion:^(BOOL finished) {
        
    }];
}

//是否显示工具栏
-(void)showTabBar:(BOOL)show
{
    CGRect frame = self.tabBarView.frame;
    if (show) {
        frame.origin.x = 0;
    }else{
        frame.origin.x = -kScreenWidth;
    }
    //重新赋值
    [UIView animateWithDuration:0.2f animations:^{
        self.tabBarView.frame = frame;
    } completion:^(BOOL finished) {
        
    }];
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
