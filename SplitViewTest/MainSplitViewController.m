//
//  MainSplitViewController.m
//  SplitViewTest
//
//  Created by junfeng on 2020/3/9.
//  Copyright © 2020 phone-ios. All rights reserved.
//

#import "MainSplitViewController.h"
#import "MasterViewController.h"
#import "DetailViewController1.h"
#import "DetailViewController2.h"
#import "DetailViewController3.h"
#import "DetailViewController4.h"

@interface MainSplitViewController ()<MasterViewControllerDelegate>
@property (nonatomic, copy) NSArray *vcs;
@end

@implementation MainSplitViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupSpliteViewController];
    }
    return self;
}

#pragma mark 设置SpliteViewController
- (void)setupSpliteViewController
{
    //左侧主视图
    MasterViewController *master = [[MasterViewController alloc] init];
    master.vcDelegate = self;
    
    //右侧默认视图
    DetailViewController1 *vc1 = [DetailViewController1 new];//刚进入应用默认显示的Controller
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:vc1];

    DetailViewController2 *vc2 = [DetailViewController2 new];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:vc2];
    
    DetailViewController3 *vc3 = [DetailViewController3 new];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:vc3];
    
    DetailViewController4 *vc4 = [DetailViewController4 new];
    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:vc4];

    // ==== 注意请看这里 ====
    // master -> 左边主视图，nav1 -> 是右边对应的详情控制器
    self.viewControllers = @[master,nav1];
    NSLog(@"%@",self.viewControllers);
    
    self.vcs = @[nav1,nav2,nav3,nav4];
    
    self.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;
    self.maximumPrimaryColumnWidth = 80;//调整左侧主视图Master Controller的最大显示宽度
}

- (void)didSelectIndex:(NSInteger)index {
    if (self.vcs.count > index) {
        [self showViewController:self.vcs[index] sender:nil];
    }
}

@end
