//
//  TextTestViewController.m
//  LHFDemo
//
//  Created by LiuHongfeng on 22/12/2016.
//  Copyright © 2016 LiuHongfeng. All rights reserved.
//

#import "TextTestViewController.h"
#import "LHFStrongLabel.h"

@interface TextTestViewController ()

@end

@implementation TextTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *textView1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, 100, 30)];
    NSString *str = @"全部是汉字";
    textView1.text = str;
    textView1.font = [UIFont systemFontOfSize:18];
    textView1.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:textView1];
    
    UILabel *textView2 = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 100, 30)];
    textView2.text = @"汉字和一个a";
    textView2.font = [UIFont systemFontOfSize:12];
    textView2.backgroundColor = [UIColor grayColor];
    [self.view addSubview:textView2];
    
    NSLog(@"textView1.font.lineHeight:%f textView2.font.lineHeight:%f",textView1.font.lineHeight,textView2.font.lineHeight);
    
    LHFStrongLabel *textView3 = [[LHFStrongLabel alloc] initWithFrame:CGRectMake(100, 300, 100, 30)];
    textView3.text = @"长按复制文本";
    textView3.font = [UIFont systemFontOfSize:12];
    textView3.backgroundColor = [UIColor grayColor];
    [self.view addSubview:textView3];

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
