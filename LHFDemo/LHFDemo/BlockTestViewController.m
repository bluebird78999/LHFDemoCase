//
//  BlockTestViewController.m
//  LHFDemo
//
//  Created by LiuHongfeng on 16/9/1.
//  Copyright © 2016年 LiuHongfeng. All rights reserved.
//

#import "BlockTestViewController.h"

@interface BlockTestViewController ()
{
}
@end

@implementation BlockTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *array = @[@"Ami",@"Tom",@"Larry"];
    NSLog(@"not sort array:%@",array);
    NSArray *sortArray = [array sortedArrayUsingComparator:^(NSString *str1, NSString *str2){
                              return [str1 compare:str2];
                          }];
    NSLog(@"sort 1 array:%@",sortArray);
    NSArray *sortArray2 = [array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    NSLog(@"sort 2 array:%@",sortArray2);

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
