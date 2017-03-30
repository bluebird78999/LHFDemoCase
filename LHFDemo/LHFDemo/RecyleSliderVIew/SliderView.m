//
//  SliderView.m
//  LHFDemo
//
//  Created by LiuHongfeng on 2017/3/29.
//  Copyright © 2017年 LiuHongfeng. All rights reserved.
//

#import "SliderView.h"

@implementation SliderView 

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _itemViews = [NSMutableArray array];
        _currentIndex = 0;
        [self addScrollView];
    }
    return self;
}

- (void)dealloc
{
    if (_scrollView) {
        _scrollView.delegate = nil;
        _scrollView = nil;
    }
}

- (void)addScrollView {
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.backgroundColor = [UIColor clearColor];
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.scrollsToTop = NO;
    [self addSubview:_scrollView];
}
- (void)insertItemView:(UIView *)view atIndex:(NSInteger)index
{
    
}
- (void)removeItemView:(UIView *)view
{

}
- (void)layoutItemViews
{

}
- (void)loadData
{

}

- (void)
@end
