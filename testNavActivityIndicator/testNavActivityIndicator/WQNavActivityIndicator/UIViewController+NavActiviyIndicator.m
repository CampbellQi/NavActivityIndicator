//
//  UIViewController+NavActiviyIndicator.m
//  testNavActivityIndicator
//
//  Created by CampbellQi on 2018/6/7.
//  Copyright © 2018年 CampbellQi. All rights reserved.
//

#import "UIViewController+NavActiviyIndicator.h"
#import "Housekeeping-Swift.h"

@implementation UIViewController (NavActiviyIndicator)
- (void)showNavActivityIndicator {
    WQNavActivityIndicatorView *ai = [WQNavActivityIndicatorView wqNavActivityIndicatorViewWithTitle:@"获取中" textAttributes:self.navigationController.navigationBar.titleTextAttributes needIndicator:true];
    self.navigationItem.titleView = ai;
}
- (void)hideNavActiviyIndicator {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.7 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        WQNavActivityIndicatorView *ai = [WQNavActivityIndicatorView wqNavActivityIndicatorViewWithTitle:self.navigationItem.title textAttributes:self.navigationController.navigationBar.titleTextAttributes needIndicator:false];
        self.navigationItem.titleView = ai;
    });
}
@end
