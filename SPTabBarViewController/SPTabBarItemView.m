//
//  SPTabBarItemView.m
//  SPTabBarViewController
//
//  Created by je_ffy on 2016/11/19.
//  Copyright © 2016年 je_ffy. All rights reserved.
//

#import "SPTabBarItemView.h"
#import "Masonry.h"

@interface SPTabBarItemView ()

@end

@implementation SPTabBarItemView

#pragma mark -
#pragma mark - LIFE_CIRCLE
- (void)dealloc {
    
}

- (id)init {
    self = [super init];
    if (self) {
        // custom init
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapItemView)];
        [self addGestureRecognizer:tap];
        
        self.contentMode = UIViewContentModeScaleAspectFit;
        self.backgroundColor = [UIColor clearColor];
        
        [self addSubview:self.normalImageView];
        [self addSubview:self.selectImageView];
        
        [self mas_makeConstraints];
    }
    
    return self;
}

#pragma mark -
#pragma mark - LAZY_LAOD
- (UIImageView *)normalImageView {
    if (_normalImageView == nil) {
        _normalImageView = [UIImageView new];
        _normalImageView.backgroundColor = [UIColor clearColor];
//        _normalImageView.userInteractionEnabled = YES;
        _normalImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    return _normalImageView;
}

- (UIImageView *)selectImageView {
    if (_selectImageView == nil) {
        _selectImageView = [UIImageView new];
        _selectImageView.frame = self.frame;
        _selectImageView.backgroundColor = [UIColor clearColor];
        _selectImageView.hidden = YES;
//        _selectImageView.userInteractionEnabled = YES;
        _selectImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    return _selectImageView;
}

- (void)mas_makeConstraints {
    [_normalImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [_selectImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}
#pragma mark -
#pragma mark - OHTER
- (void)setSelected:(BOOL)selected {
    _selected = selected;
    
    if (selected == YES) {
        self.selectImageView.hidden = NO;
        self.normalImageView.hidden = YES;
    }
    else {
        self.selectImageView.hidden = YES;
        self.normalImageView.hidden = NO;
    }
}

- (void)tapItemView {
    if (self.tapCallBack) {
        self.tapCallBack(self);
    }
}

@end
