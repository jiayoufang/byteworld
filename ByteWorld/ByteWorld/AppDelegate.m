//
//  AppDelegate.m
//  ByteWorld
//
//  Created by 方 on 15/3/31.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "AppDelegate.h"
#import "JYTabbarViewController.h"
//瀑布流
#import "JYWaterFallViewController.h"

//手势
#import "JYPinGestureViewController.h"

//手势锁
#import "JYLockViewController.h"

//图片定时滑动
#import "JYClockSlipViewController.h"

//类似QQ列表实现
#import "JYListTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
//    JYTabbarViewController *tabBarController = [[JYTabbarViewController alloc]init];
//    self.window.rootViewController = tabBarController;

    //瀑布流
//    JYWaterFallViewController *waterFall = [[JYWaterFallViewController alloc]init];
//    self.window.rootViewController = waterFall;
    
    //手势
//    JYPinGestureViewController *pin = [[JYPinGestureViewController alloc]init];
//    UINavigationController *navPin = [[UINavigationController alloc]initWithRootViewController:pin];
//    self.window.rootViewController = pin;
    
    //手势锁
//    JYLockViewController *lock = [[JYLockViewController alloc]init];
//    self.window.rootViewController = lock;
    
    //图片定时滑动
//    JYClockSlipViewController *clockSlip = [[JYClockSlipViewController alloc]init];
//    self.window.rootViewController = clockSlip;
    
    //QQ列表实现
    JYListTableViewController *list = [[JYListTableViewController alloc]init];
    UINavigationController *navList = [[UINavigationController alloc]initWithRootViewController:list];
    self.window.rootViewController = navList;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
