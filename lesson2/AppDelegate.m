//
//  AppDelegate.m
//  lesson2
//
//  Created by rimi on 15/6/2.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"


@interface AppDelegate ()

@end


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //手动创建：
    //1,删除info.plist中的关于配置stroeboard的代码
    //2,在app delegate中第一个方法配置window
    //3,导入相应的跟控制器头文件并且创建
    //4,设置根控制器
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    self.window.backgroundColor = [UIColor colorWithRed:57/255 green:154/255 blue:251/255 alpha:1];
    self.window.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.9 alpha:2];
    [self.window makeKeyAndVisible];
    
    //设置根控制器
    ViewController *vc = [[ViewController  alloc]init];
    
    self.window.rootViewController = vc;
    
    
#pragma mark - 代码片段
//    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    
//    self.window.rootViewController = <#jh#><# 标记    # >
//    ;
    
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
