//
//  LHFRecyleSliderViewController.m
//  LHFDemo
//
//  Created by LiuHongfeng on 2017/3/27.
//  Copyright © 2017年 LiuHongfeng. All rights reserved.
//

#import "LHFRecycleSliderViewController.h"
#import "LHFRecycleSliderView.h"

@interface LHFRecycleSliderViewController ()

@end

@implementation LHFRecycleSliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIView * view1 = [[UIView alloc]init];
    UIView * view2 = [[UIView alloc]init];
    UIView * view3 = [[UIView alloc]init];
    UIView * view4 = [[UIView alloc]init];
    
    
    view1.backgroundColor = [UIColor blueColor];
    view2.backgroundColor = [UIColor redColor];
    view3.backgroundColor = [UIColor yellowColor];
    view4.backgroundColor = [UIColor greenColor];
    
    
    NSArray <UIView *> * views = @[view1,view2,view3,view4];
    
    LHFRecycleSliderView *sliderView = [[LHFRecycleSliderView alloc]initWithFrame:CGRectMake(50, 100, 300, 200) withViews:views withPageControl:NO];
    
    [self.view addSubview:sliderView];
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
