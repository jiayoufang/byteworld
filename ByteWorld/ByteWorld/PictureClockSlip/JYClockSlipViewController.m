//
//  JYClockSlipViewController.m
//  ByteWorld
//
//  Created by fangjiayou on 15/4/5.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "JYClockSlipViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
NSInteger kImageCount = 6;
CGFloat scrollY = 20;
CGFloat pageCtrlWidth = 200;

@interface JYClockSlipViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong) UIScrollView *scrollView;
@property(nonatomic,strong) UIPageControl *pageControl;
@property(nonatomic,strong) NSTimer *timer;

@end

@implementation JYClockSlipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initScrollView];
    [self initPageControl];
    
    [self addTimer];
}

-(void)initScrollView
{
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, scrollY, kScreenWidth, kScreenHeight-scrollY)];
    self.scrollView.delegate = self;
    for (int i = 0; i<kImageCount; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth*i, scrollY, kScreenWidth, kScreenHeight-scrollY)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"huoying%d",i+1]];
        [self.scrollView addSubview:imageView];
    }
    self.scrollView.contentSize = CGSizeMake(kScreenWidth*kImageCount, kScreenHeight-20);
    self.scrollView.pagingEnabled = YES;
    [self.view addSubview:self.scrollView];
}

-(void)initPageControl
{
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake((kScreenWidth-pageCtrlWidth)*0.5, (kScreenHeight-scrollY), pageCtrlWidth, scrollY)];
    self.pageControl.numberOfPages = kImageCount;
    self.pageControl.pageIndicatorTintColor = [UIColor redColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
    [self.view insertSubview:self.pageControl aboveSubview:self.scrollView];
}

-(NSTimer*)timer
{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    }
    return _timer;
}

-(void)addTimer
{
    //    [self removeTimer];
    
    //    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}

-(void)nextPage
{
    NSInteger page = self.pageControl.currentPage;
    page++;
    CGPoint point = CGPointMake(kScreenWidth*(page%kImageCount), scrollY);
    
    [UIView animateWithDuration:0.5f animations:^{
        self.scrollView.contentOffset = point;
    } completion:^(BOOL finished) {
        
    }];
    NSLog(@"page = %ld ",page);
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //加0.5是为了当前页面有两张图片的时候，滑动到下一张
    NSInteger page = scrollView.contentOffset.x/kScreenWidth + 0.5;
    [UIView animateWithDuration:0.5f animations:^{
        self.pageControl.currentPage = page;
    } completion:^(BOOL finished) {
        
    }];
    
}

//当试图将要拖动时
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //手动拖动时候停掉计时器
    [self removeTimer];
}

//当视图停止拖拽的时候调用
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //停止拖动后2秒开始计时器
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self addTimer];
    });
}

-(void)removeTimer
{
    [self.timer invalidate];
    self.timer = nil;
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
