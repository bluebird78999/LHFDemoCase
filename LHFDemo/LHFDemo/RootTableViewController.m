//
//  RootTableViewController.m
//  LHFDemo
//
//  Created by LiuHongfeng on 11/2/15.
//  Copyright © 2015 LiuHongfeng. All rights reserved.
//

#import "RootTableViewController.h"
#import "EditTableViewController.h"
#import "BlockTestViewController.h"
#import "LHFWebViewController.h"

@interface RootTableViewController ()
{
    NSArray *_titles;
    NSArray *_classNames;
}
@end

@implementation RootTableViewController

- (instancetype) initWithStyle:(UITableViewStyle)style
{
    if (self = [super initWithStyle:style]) {
        _titles = @[@"table编辑",@"block test",@"webview test"];
        _classNames = @[@"EditTableViewController",@"BlockTestViewController",@"LHFWebViewController"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *idtf = @"reuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idtf];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idtf];
    }
    // Configure the cell...
    if (indexPath.row < _titles.count) {
        cell.textLabel.text = _titles[indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *controller ;
    if (indexPath.row < _classNames.count) {
        controller = [[NSClassFromString(_classNames[indexPath.row]) alloc] initWithNibName:nil bundle:nil];
    }
    [self.navigationController pushViewController:controller animated:NO];
}




@end
