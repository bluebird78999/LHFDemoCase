//
//  LHFWebViewController.m
//  LHFDemo
//
//  Created by LiuHongfeng on 2016/11/17.
//  Copyright © 2016年 LiuHongfeng. All rights reserved.
//

#import "LHFWebViewController.h"

@interface LHFWebViewController ()<UIWebViewDelegate>

@end

@implementation LHFWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.webView  = [[UIWebView alloc] initWithFrame:CGRectMake(0, 100, 300, 300)];
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://m.baidu.com"]]];
    [self performSelector:@selector(dealyLoadWrongURL) withObject:nil afterDelay:10];
}


- (void)dealyLoadWrongURL
{
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://m.baiduss.com"]]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"fail load:%@",error.description);
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
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
