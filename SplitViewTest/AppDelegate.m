//
//  AppDelegate.m
//  SplitViewTest
//
//  Created by junfeng on 2020/3/9.
//  Copyright © 2020 phone-ios. All rights reserved.
//

#import "AppDelegate.h"
#import "MainSplitViewController.h"

@interface AppDelegate ()
@property (nonatomic, strong) MainSplitViewController *spliteViewController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.spliteViewController = [[MainSplitViewController alloc]init];
    self.window.rootViewController = self.spliteViewController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
