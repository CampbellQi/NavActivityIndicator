//
//  UIViewController+NavActiviyIndicator.m
//  testNavActivityIndicator
//
//  Created by CampbellQi on 2018/6/7.
//  Copyright © 2018年 CampbellQi. All rights reserved.
//

#import "UIViewController+NavActiviyIndicator.h"
#import "testNavActivityIndicator-Swift.h"

@implementation UIViewController (NavActiviyIndicator)
- (void)showNavActivityIndicator {
    if ([self.navigationItem.titleView isKindOfClass:WQNavActivityIndicatorView.class] == false) {
        WQNavActivityIndicatorView *nai = [[WQNavActivityIndicatorView alloc] initWithFrame:CGRectZero title:self.title];
        self.navigationItem.titleView = nai;
        
        NSDictionary *titleTextAttributes = self.navigationController.navigationBar.titleTextAttributes;
        UIFont *font = titleTextAttributes[NSFontAttributeName];
        UIColor *color = titleTextAttributes[NSForegroundColorAttributeName];
        
        nai.titleLable.font = font;
        nai.titleLable.textColor = color;
    }
    [(WQNavActivityIndicatorView *)self.navigationItem.titleView start];
}
- (void)hideNavActiviyIndicator {
    [(WQNavActivityIndicatorView *)self.navigationItem.titleView stop];
}
@end
