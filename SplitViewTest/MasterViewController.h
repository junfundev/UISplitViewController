//
//  MasterViewController.h
//  SplitViewTest
//
//  Created by junfeng on 2020/3/9.
//  Copyright © 2020 phone-ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MasterViewControllerDelegate;

@interface MasterViewController : UIViewController

@property (nonatomic, weak) id <MasterViewControllerDelegate> vcDelegate;

@property (nonatomic, assign) NSInteger index;

@end


@protocol MasterViewControllerDelegate <NSObject>

- (void)didSelectIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
