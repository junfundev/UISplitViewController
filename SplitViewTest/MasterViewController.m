//
//  MasterViewController.m
//  SplitViewTest
//
//  Created by junfeng on 2020/3/9.
//  Copyright © 2020 phone-ios. All rights reserved.
//

#import "MasterViewController.h"

@interface MasterViewController ()
@property (nonatomic, strong) UIButton *selectedButton;
@property (nonatomic, strong) NSMutableArray <UIButton *>*buttons;
@end

@implementation MasterViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        self.view.layer.borderColor = [UIColor redColor].CGColor;
        self.view.layer.borderWidth = 1.f;
        [self setupBtns];
        self.index = 0;
    }
    return self;
}

- (void)setupBtns {
    NSArray *btns = @[@"Tab1",@"Tab2",@"Tab3",@"Tab4"];
    self.buttons = [[NSMutableArray alloc] initWithCapacity:btns.count];
    [btns enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 200 + idx * (60 + 20), 60, 60)];
        [self.view addSubview:btn];
        [self.buttons addObject:btn];
        btn.tag = idx;
        [btn setTitle:obj forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        btn.layer.borderColor = [UIColor redColor].CGColor;
        btn.layer.borderWidth = 1.f;
        [btn addTarget:self action:@selector(onclickbutton:) forControlEvents:UIControlEventTouchUpInside];        
    }];
}

- (void)setIndex:(NSInteger)index {
    _index = index;
    __block UIButton *selBtn = nil;
    [self.buttons enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.tag == idx) {
            selBtn = obj;
            * stop = YES;
        }
    }];
    
    if (selBtn == nil) return;
    
    [self onclickbutton:selBtn];
}

- (void)onclickbutton:(UIButton *)sender {
    if (self.selectedButton == sender) return;
    
    [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.selectedButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.selectedButton = sender;
    
    if ([self.vcDelegate respondsToSelector:@selector(didSelectIndex:)]) {
        [self.vcDelegate didSelectIndex:sender.tag];
    }
}


@end
