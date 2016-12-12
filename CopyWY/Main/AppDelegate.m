//
//  AppDelegate.m
//  CopyWY
//
//  Created by abnerzhang on 16/8/18.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

/**
 *  新建启动图片
 *
 *  1. 在Image.xcassets 中右击New Launch Image 其中 Portrait -- 竖屏 , Landscape -- 横屏
 *  2. 拖入相应尺寸的图片
 *  3. 在General里面设置, Lanch Images Source为LaunchImage, Lanch Screen File 为空
 *  4. 删除LaunchScreen.storyboard(低版本为LaunchScreen.xib)
 *  5. 运行即可, 如果遇到没有效果的情况, 建议删除app后重新运行
 *  (设置启动图片停留时间: [NSThread sleepForTimeInterval:3.0];)
 */
#import "AppDelegate.h"
#import "MainTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    MainTabBarController *tabBar = [[MainTabBarController alloc] init];
    [self.window setRootViewController:tabBar];
    [self.window makeKeyAndVisible];
    [NSThread sleepForTimeInterval:3.0];
    // Override point for customization after application launch.
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
