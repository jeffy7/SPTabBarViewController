//
//  SPTabBar.m
//  SPTabBarViewController
//
//  Created by je_ffy on 2016/11/19.
//  Copyright © 2016年 je_ffy. All rights reserved.
//

#import "SPTabBar.h"

@implementation SPTabBar

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.hidden == YES || self.userInteractionEnabled == NO || self.alpha == 0.0f) {
        [super hitTest:point withEvent:event];
    }else {
        UIView *view = [super hitTest:point withEvent:event];
        for (UIView *subview in self.subviews) {
            if (view != nil && view.userInteractionEnabled)
                break;
            CGPoint newPoint = [self convertPoint:point toView:subview];
            view = [subview hitTest:newPoint withEvent:event];
        }
        return view;
    }
    return [super hitTest:point withEvent:event];
}

@end
