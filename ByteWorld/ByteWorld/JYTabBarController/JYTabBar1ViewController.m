//
//  JYTabBar1ViewController.m
//  ByteWorld
//
//  Created by 方 on 15/3/31.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "JYTabBar1ViewController.h"
#import "JYTabPushViewController.h"
#import "JYTabbarViewController.h"


@interface JYTabBar1ViewController ()<UIGestureRecognizerDelegate>

@end

@implementation JYTabBar1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"mask_navbar"] forBarMetrics:UIBarMetricsDefault];
 
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(push:)];
    
//    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"POP" style:UIBarButtonItemStylePlain target:self action:@selector(pop:)];
}

-(void)push:(id)sender
{
    JYTabPushViewController *pushVC = [[JYTabPushViewController alloc]init];
    [self.navigationController pushViewController:pushVC animated:YES];
    
    JYTabbarViewController *tabBar = (JYTabbarViewController*)self.tabBarController;
    [tabBar showTabBar:NO];
}

//-(void)pop:(id)sender
//{
//    NSLog(@"POP");
//}


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    JYTabbarViewController *tabBar = (JYTabbarViewController*)self.tabBarController;
    [tabBar showTabBar:YES];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

#pragma mark - UIGestureRecognizerDelegate
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    //解决在UINavigationController的rootViewController中做一个会触发滑动返回操作后，在点击pushViewController按钮时。UINavigationController没有任何的反应，而如果使用home按键返回主屏，在进入，发现已经push到刚才应该进入的ViewController中了
    return (self != self.navigationController.viewControllers.firstObject);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
 参考：http://weizhe.me/ios-7-back-gesture-sample/
 
 问题1：
 如果在pushViewController的动画过程中触发滑动返回，会导致闪退。
 解决：在push之后禁用interactivePopGestureRecognizer，在viewController显示之后再恢复就可以了
 问题2：
 触发不够灵敏，而且有UITableView或者其他可滚动的UIScrollView，当其在滚动时，是不能触发滑动返回的，而正常的效果是可以触发的。
 解决：是由于手势冲突导致的。那就让ViewController可以接受多个手势
 - (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
 {
 return YES;
 }
 问题3：
 手指滑动时候，被pop的ViewController中的UISCrollView会跟着一起滚动
 解决：
 - (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
 {
 return [gestureRecognizer isKindOfClass:UIScreenEdgePanGestureRecognizer.class];
 }
 问题4：
 设置自定义的返回按钮图片
 解决：
 UIImage *image = [UIImage imageNamed:@"nav_back_btn"];
 [UINavigationBar appearance].backIndicatorImage = image;
 [UINavigationBar appearance].backIndicatorTransitionMaskImage = image;
 这样后发现图片被渲染成navigationBar的tintColor的颜色
 UIImage *image = [UIImage imageNamed:@"nav_back_btn"];
 image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
 [UINavigationBar appearance].backIndicatorImage = image;
 [UINavigationBar appearance].backIndicatorTransitionMaskImage = image;
 */
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
