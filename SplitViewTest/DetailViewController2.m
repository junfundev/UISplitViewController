//
//  DetailViewController2.m
//  SplitViewTest
//
//  Created by junfeng on 2020/3/9.
//  Copyright © 2020 phone-ios. All rights reserved.
//

#import "DetailViewController2.h"

@interface DetailViewController2 ()
{
    UIButton *label;
}
@end

@implementation DetailViewController2



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    
    label = [[UIButton alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:label];
    
    self.title = NSStringFromClass([self class]);
    [label setTitle:self.title forState:UIControlStateNormal];
    [label setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [label addTarget:self action:@selector(touch) forControlEvents:UIControlEventTouchUpInside];
    label.layer.borderColor = [UIColor redColor].CGColor;
    label.layer.borderWidth = 1.f;
    
}

- (void)touch {
    UIViewController *vc = [[[self class] alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    label.frame = self.view.bounds;
}

@end
