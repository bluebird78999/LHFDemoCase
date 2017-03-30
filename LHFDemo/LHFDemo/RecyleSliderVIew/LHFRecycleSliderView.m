//
//  LHFRecyleSliderView.m
//  LHFDemo
//
//  Created by LiuHongfeng on 2017/3/27.
//  Copyright © 2017年 LiuHongfeng. All rights reserved.
//

#import "LHFRecycleSliderView.h"

#define ScrollHeight self.bounds.size.height
#define ScrollWidth self.bounds.size.width



NS_ASSUME_NONNULL_BEGIN

@interface LHFRecycleSliderView () <UIScrollViewDelegate>
{
    BOOL _isPageHidden;
}

@property (nonatomic, strong) UIScrollView * scrollView NS_AVAILABLE_IOS(7_0);
@property (nonatomic, strong) NSTimer *timer;

@end

NS_ASSUME_NONNULL_END

@implementation LHFRecycleSliderView


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [self initWithFrame:frame withViews:nil withPageControl:NO])
    {
        
    }
    
    return self;
}



-(instancetype)initWithFrame:(CGRect)frame withViews:(NSArray<UIView *> *)views withPageControl:(BOOL)isHidden
{
    if (self = [super initWithFrame:frame])
    {
        _timeInteval = 2.0;
        _isPageHidden = isHidden;
        _views = views;
        [self ywCarousViewLoad];
        self.backgroundColor = [UIColor grayColor];
    }
    
    return self;
}


- (void)ywCarousViewLoad
{
    
    if (_views == nil)
    {
        return;
    }
    
    [self loadScrollView];
}



- (void)loadScrollView
{
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollView.delegate = self;//设置代理
    [_scrollView setContentOffset:CGPointMake(ScrollWidth, 0)];//将起始点定义到第二张图
    [_scrollView setContentSize:CGSizeMake(ScrollWidth * (_views.count + 2), 0)];
    _scrollView.backgroundColor = [UIColor redColor];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
//    _scrollView.alwaysBounceVertical = NO;
//    _scrollView.bounces = NO;
    _scrollView.pagingEnabled = NO;
    [self addSubview:_scrollView];//在父视图上添加
    [self bringDataToScrollView];
}


- (void)bringDataToScrollView
{
    //添加第一个视图
    UIView * firstView = [_views lastObject];
    firstView.frame = CGRectMake(0, 0, ScrollWidth, ScrollHeight);
    [_scrollView addSubview:firstView];
    
    
    for (NSInteger i = 1 ; i < _views.count ; i++)
    {
        UIView * view1 = [_views objectAtIndex:i - 1];
        view1.frame = CGRectMake(i * ScrollWidth, 0, ScrollWidth, ScrollHeight);
        [_scrollView addSubview:view1];
    }
    
    //添加最后一个视图
    UIView * lastView = [_views firstObject];
    lastView.frame = CGRectMake(ScrollWidth*(_views.count +1), 0, ScrollWidth, ScrollHeight);
    [_scrollView addSubview:lastView];

    for (UIView *view in _views) {
        NSLog(NSStringFromCGRect(view.frame));
    }
}


#pragma mark - Timer
- (void) changeView
{
    //获得当先scrollView滚动到的点（俗称偏移量）
    CGFloat offSetX = self.scrollView.contentOffset.x;//获取当前滚动视图的contentOffSet的x值
    
    //让scrollView向右滚动一个屏幕宽的距离
    offSetX += ScrollWidth;
    
    [self.scrollView setContentOffset:CGPointMake(offSetX, 0) animated:YES];//开始偏移并伴有动画效果
}


#pragma mark - UIScrollView Delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    //获得偏移量
//    CGPoint point = _scrollView.contentOffset;
//    //获得当前的最大x值(在可见区域内，最大的x轴上的值)
//    CGFloat manX = ScrollWidth * _views.count;
//    
//    //到达切换页
//    if (point.x == 0 || point.x == (ScrollWidth * (_views.count - 1)))
//    {
//        [_views lastObject].frame = CGRectMake(manX, 0, ScrollWidth, ScrollHeight);
//        [_scrollView addSubview:[_views lastObject]];
//        
//        if (point.x == 0)
//        {
//            [_scrollView setContentOffset:CGPointMake(manX, 0)];//立马跳到倒数第二张(因为最后一张是为了往后滚动做的铺垫视图)
//        }
//    }
//    
//    //如果当前点到达第一张，即坐标为x,0
//    if (point.x == ScrollWidth)
//    {
//        //移动视图
//        [_views lastObject].frame = CGRectMake(0, 0, ScrollWidth, ScrollHeight);
//        [_scrollView addSubview:[_views lastObject]];
//        
//    }
//    
//    
//    if (point.x == manX)
//    {
//        //移动视图
//        [_views firstObject].frame = CGRectMake(manX + ScrollWidth, 0, ScrollWidth, ScrollHeight);
//        [_scrollView addSubview:[_views firstObject]];
//    }
//    
//    if (point.x == 2 * ScrollWidth || point.x == (manX + ScrollWidth))
//    {
//        [_views firstObject].frame = CGRectMake(ScrollWidth, 0, ScrollWidth, ScrollHeight);
//        [_scrollView addSubview:[_views firstObject]];
//        
//        if (point.x == (manX + ScrollWidth))
//        {
//            //滚动
//            [_scrollView setContentOffset:CGPointMake(ScrollWidth, 0)];
//        }
//    }
//    
//    
//    //设置pageControl的点数
//    NSInteger pageNumber = [self pageIndexWithContentOffset:scrollView.contentOffset];//自定义方法，根据偏移量设置当前页码
//    self.pageControl.currentPage = pageNumber;
}


-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [_timer invalidate];
    _timer = nil;
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:_timeInteval target:self selector:@selector(changeView) userInfo:nil repeats:YES];
}


#pragma mark - Other
-(NSInteger)pageIndexWithContentOffset:(CGPoint)contentOffSet
{
    return (contentOffSet.x - ScrollWidth) / self.bounds.size.width;
}

-(void)dealloc
{
    _scrollView.delegate = nil;
    
}

@end
