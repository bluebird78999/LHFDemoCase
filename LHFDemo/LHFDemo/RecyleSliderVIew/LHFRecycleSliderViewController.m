//
//  LHFRecyleSliderViewController.m
//  LHFDemo
//
//  Created by LiuHongfeng on 2017/3/27.
//  Copyright © 2017年 LiuHongfeng. All rights reserved.
//

#import "LHFRecycleSliderViewController.h"
#import "LHFRecycleSliderView.h"
#import "CCCycleScrollView.h"
#import "ScottPageView.h"

@interface LHFRecycleSliderViewController ()

@end

@implementation LHFRecycleSliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
//轮播demo 1
//    UIView * view1 = [[UIView alloc]init];
//    
//    UIView * view2 = [[UIView alloc]init];
//    
//    UIView * view3 = [[UIView alloc]init];
//    
//    UIView * view4 = [[UIView alloc]init];
//    
//    view1.backgroundColor = [UIColor blueColor];
//    view2.backgroundColor = [UIColor redColor];
//    view3.backgroundColor = [UIColor yellowColor];
//    view4.backgroundColor = [UIColor greenColor];
//    
//    
//    NSArray <UIView *> * views = @[view1,view2];
//    for (int i = 0; i < views.count; i ++) {
//        UILabel *label  = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
//        label.backgroundColor = [UIColor clearColor];
//        label.textColor = [UIColor blackColor];
//        label.text = [NSString stringWithFormat:@"第%d页",i];
//        [[views objectAtIndex:i] addSubview:label];
//    }
//    LHFRecycleSliderView *sliderView = [[LHFRecycleSliderView alloc]initWithFrame:CGRectMake(50, 100, 300, 200) withViews:views withPageControl:NO];
//    
//    [self.view addSubview:sliderView];
    
//轮播demo 2
//    NSMutableArray *images = [[NSMutableArray alloc]init];
//    for (NSInteger i = 1; i <= 4; ++i) {
//        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"cycle_image%ld",(long)i]];
//        [images addObject:image];
//    }
//    CCCycleScrollView *cyclePlayView2 = [[CCCycleScrollView alloc]initWithImages:images withFrame:CGRectMake(0, self.view.frame.size.height/2, self.view.frame.size.width, self.view.frame.size.height/4)];
//    cyclePlayView2.pageDescrips = @[@"大海",@"花",@"长灯",@"阳光下的身影",@"秋树",@"摩天轮"];
//    cyclePlayView2.pageLocation = CCCycleScrollPageViewPositionBottomRight;
//    [self.view addSubview:cyclePlayView2];


    //轮播demo 3
    NSMutableArray *picArrs = [[NSMutableArray alloc] init];
    for (NSInteger i = 1; i <= 2; ++i) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"cycle_image%ld",(long)i]];
        [picArrs addObject:image];
    }

    NSMutableArray *desArr = [[NSMutableArray alloc] init];
    for (NSInteger i=0; i<picArrs.count; i++) {
        NSString *tempDesc = [NSString stringWithFormat:@"这是第%ld张图片描述",i+1];
        [desArr addObject:tempDesc];
    }

    ScottPageView *pageViewCode = [ScottPageView pageViewWithImageArr:picArrs andImageClickBlock:^(NSInteger index) {
        NSLog(@"点击代码创建的第%ld张图片",index+1);
    }];
    pageViewCode.frame = CGRectMake(0, 64, self.view.frame.size.width, 180);
    pageViewCode.describeArray = desArr;
    pageViewCode.time = 1;
    [self.view addSubview:pageViewCode];
    CGRect originFrame = pageViewCode.pageControl.frame;
    originFrame.origin.y = CGRectGetHeight(pageViewCode.frame) - 30;
    pageViewCode.pageControl.frame = originFrame;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
