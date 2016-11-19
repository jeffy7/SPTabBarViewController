//
//  SPTabBarView.m
//  SPTabBarViewController
//
//  Created by je_ffy on 2016/11/19.
//  Copyright © 2016年 je_ffy. All rights reserved.
//


#import "SPTabBarView.h"
#import "SPTabBarItemView.h"

#define ITEM_TAG_BASE  (123456)

@implementation SPTabBarView

#pragma mark -
#pragma mark - Life  Cycle
- (void)dealloc {
    
}

- (instancetype)init {
    if (self = [super init]) {
        
    }
    
    return self;
}

#pragma mark -
#pragma mark - Set Method
- (void)setItems:(NSArray *)items {
    _items = items;
    [self creatSubViews];
}

- (void)creatSubViews {
    for (UIView *subView in self.subviews) {
        [subView removeFromSuperview];
    }
    // gapvalue
    float itemWidth = [[UIScreen mainScreen] bounds].size.width/([_items count]);
    
    [_items enumerateObjectsUsingBlock:^(SPTabBarItemView *itemView, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 0) {
            itemView.selected = YES;
            _selectIndex = 0;
        }
        else {
            itemView.selected = NO;
        }
        itemView.frame = CGRectMake(itemWidth * idx, .0f, itemWidth, 49.0f);
        itemView.layer.borderWidth = 0.50f;
        itemView.layer.borderColor = [UIColor yellowColor].CGColor;
        itemView.tag = ITEM_TAG_BASE + idx;
        __weak typeof(self) weakself = self;
        itemView.tapCallBack = ^(SPTabBarItemView *itemView){
            [weakself itemTapedWith:itemView];
        };
        [self addSubview:itemView];
        
    }];

}

- (void)itemTapedWith:(SPTabBarItemView *)tarItem {
    if (tarItem.canSelect == YES) {
        if (tarItem.selected == NO) {
            for (SPTabBarItemView *itemView in _items) {
                itemView.selected = NO;
                itemView.userInteractionEnabled = YES;
            }
            
            tarItem.selected = YES;
            tarItem.userInteractionEnabled = NO;
            
            int index = (int)[_items indexOfObject:tarItem];
            
            if (self.tapBarViewCallBack) {
                _selectIndex = index;
                self.tapBarViewCallBack(tarItem,index);
            }
        }
    }else {
        int index = (int)[_items indexOfObject:tarItem];
        if (self.tapBarViewCallBack) {
            _selectIndex = index;
            self.tapBarViewCallBack(tarItem,index);
        }
    }
}


- (void)setSelectIndex:(int)selectIndex {
    _selectIndex = selectIndex;
    
    for (SPTabBarItemView *item in _items) {
        NSUInteger index = [_items indexOfObject:item];
        if (index == selectIndex) {
            item.selected = YES;
            item.userInteractionEnabled = NO;
            
        }else {
            item.selected = NO;
            item.userInteractionEnabled = YES;
        }
    }
}


- (void)refreshWithSomething {
    
}

#pragma mark -
#pragma mark - HIT_TEST
- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
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
