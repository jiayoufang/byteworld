//
//  JYSystemViewController.m
//  ByteWorld
//
//  Created by fangjiayou on 15/4/12.
//  Copyright (c) 2015年 方. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

#import "JYSystemViewController.h"

#import "DeviceInfo.h"

@interface JYSystemViewController ()

@end

@implementation JYSystemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

///跳转至系统设置界面iOS8以上支持
-(void)click1:(id)sender
{
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
}

//手机震动
-(void)click2:(id)sender
{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);//（ #import <AVFoundation/AVFoundation.h>）
}

//播放声音
static SystemSoundID shake_sound_id = 0;

-(void)click3:(id)sender
{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"sound" ofType:@"wav"];
    if (path) {
        //注册声音到系统
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)([NSURL fileURLWithPath:path]), &shake_sound_id);
        AudioServicesPlaySystemSound(shake_sound_id);
    }
}

//检测耳机的插入和拔出
-(BOOL)addHeadPhoneListener
{
//    OSStatus status = AudioSessionAddPropertyListener(<#AudioSessionPropertyID inID#>, <#AudioSessionPropertyListener inProc#>, <#void *inClientData#>)
    return YES;
}

void audioRouteChangeListenerCallback()
{
    
}

//获取IP
-(void)click4:(id)sender
{
    NSLog(@"ip = %@",[DeviceInfo IPAddress]);
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
