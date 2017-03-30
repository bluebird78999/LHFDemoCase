//
//  LHFRecycleSliderView
//  LHFDemo
//  用三个view来实现UIScroller按页无限循环滚动
//  Created by LiuHongfeng on 2017/3/27.
//  Copyright © 2017年 LiuHongfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_CLASS_AVAILABLE_IOS(7_0) @interface LHFRecycleSliderView : UIView



@property (nonatomic, assign) CGFloat timeInteval NS_AVAILABLE_IOS(7_0);//滚动时间间隔,default is 3s


@property (nonatomic, copy, readonly)NSArray < __kindof UIView *> * views NS_AVAILABLE_IOS(7_0);//存放展示的视图数组


/**
 *  初始化方法
 *
 *  @param frame        创建的frame
 *  @param views        展现数据的数据组,default is nil
 *  @param isHidden     页码控制器是否显示,default is NO
 */
- (instancetype) initWithFrame:(CGRect)frame withViews:(NSArray <UIView *> *)views withPageControl:(BOOL)isHidden NS_AVAILABLE_IOS(7_0);

@end
