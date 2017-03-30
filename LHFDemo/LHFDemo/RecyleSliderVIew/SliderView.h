//
//  SliderView.h
//  LHFDemo
//
//  Created by LiuHongfeng on 2017/3/29.
//  Copyright © 2017年 LiuHongfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SliderView : UIView <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *itemViews;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, assign) BOOL isStartScroll;

- (void)insertItemView:(UIView *)view atIndex:(NSInteger)index;
- (void)removeItemView:(UIView *)view;
- (void)layoutItemViews;
- (void)loadData;

@end
