//
//  SPTabBarItemView.h
//  SPTabBarViewController
//
//  Created by je_ffy on 2016/11/19.
//  Copyright © 2016年 je_ffy. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SPTabBarItemView.h"
@class SPTabBarItemView;

typedef void(^TapTabBarItemCallBack)(SPTabBarItemView *);

@interface SPTabBarItemView : UIView

@property (nonatomic, assign) BOOL canSelect;
@property (nonatomic, assign) BOOL selected;
@property (nonatomic, retain) UIImageView *normalImageView;
@property (nonatomic, retain) UIImageView *selectImageView;

@property (nonatomic, copy) TapTabBarItemCallBack tapCallBack;

@end
