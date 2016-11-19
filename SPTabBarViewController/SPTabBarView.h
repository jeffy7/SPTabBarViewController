//
//  SPTabBarView.h
//  SPTabBarViewController
//
//  Created by je_ffy on 2016/11/19.
//  Copyright © 2016年 je_ffy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SPTabBarItemView;

typedef void(^TapTabBarViewCallBack)(SPTabBarItemView *,NSInteger );

@interface SPTabBarView : UIView

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, assign) int selectIndex;
@property (nonatomic, copy) TapTabBarViewCallBack tapBarViewCallBack;
- (void)refreshWithSomething;

@end
