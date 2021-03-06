//
//  AppDelegate.m
//  MJ_iOS_Proj
//
//  Created by minjie on 02/08/16.
//  Copyright © 2016 minjie. All rights reserved.
//

#import "AppDelegate.h"
#import "InfoVC.h"
#import "DiscoverVC.h"
#import "UtilClass.h"
#import "UtilMacro.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // Non-UI stuff
    [self setupDirectory];
    
    // Main window
    _window=[[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    
    // Create the main UI skeleton
    UITabBarController *tabController=[[UITabBarController alloc]init];
    UINavigationController *nav_Info=[[UINavigationController alloc]initWithRootViewController:[[InfoVC alloc]init]];
    UINavigationController *nav_Discover=[[UINavigationController alloc]initWithRootViewController:[[DiscoverVC alloc]init]];
    tabController.viewControllers=@[nav_Info, nav_Discover];
    nav_Info.tabBarItem.title=@"Info";
    nav_Discover.tabBarItem.title=@"Discover";

    _window.rootViewController=tabController;
    

    [_window makeKeyAndVisible];
    
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


#pragma mark - Util
- (void)setupDirectory
{
    // create directory if not exist
    NSString *strdbDirPath =[[UtilClass getDocumentsPath]stringByAppendingString:PATH_DB];
    
    NSError *err;
    if (![[NSFileManager defaultManager]fileExistsAtPath:strdbDirPath]) {
        [[NSFileManager defaultManager]createDirectoryAtPath:strdbDirPath withIntermediateDirectories:NO attributes:nil error:&err];
        if (err) {
            NSLog(@"%@ >>> Direction creation error:%@",[self class] ,err);
        }
    }
}
@end
