//
//  EditTableViewController.m
//  LHFDemo
//
//  Created by LiuHongfeng on 16/8/15.
//  Copyright © 2016年 LiuHongfeng. All rights reserved.
//

#import "EditTableViewController.h"

@interface EditTableViewController ()
{
    NSInteger _rowsCount;
    BOOL _isEditing;
}
@end

@implementation EditTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _rowsCount = 10;
    _isEditing = NO;
    self.tableView.allowsMultipleSelectionDuringEditing = YES;
    [self setRightButtonItem:@"编辑"];
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
    return _rowsCount;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Configure the cell...
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"test"];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"test"];
    }
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat:@"Test %ld",indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    UIView *bgView = [[UIView alloc] initWithFrame:cell.contentView.bounds];
    bgView.backgroundColor = [UIColor redColor];
    cell.multipleSelectionBackgroundView = bgView;
    UIView *editView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
    editView.backgroundColor = [UIColor greenColor];
    cell.editingAccessoryView = editView;
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //修改数据源，在刷新 tableView
        //[_dataSource removeObjectAtIndex:indexPath.row];
        _rowsCount  -= 1;
        //让表视图删除对应的行
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

- (void)setRightButtonItem:(NSString *)title
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(changeEditState)];
}


- (void)changeEditState
{
    if (self.tableView.isEditing) {
        [self.navigationItem.rightBarButtonItem setTitle:@"编辑"];
        [self.tableView beginUpdates];
        NSArray * selectRows = [self.tableView indexPathsForSelectedRows];
        NSMutableIndexSet * indexpaths = [[NSMutableIndexSet alloc] init];
        for(NSIndexPath * path in selectRows){
            [indexpaths addIndex:path.row];
        }
        //        [self.dataArray removeObjectsAtIndexes:indexpaths];
        _rowsCount -= indexpaths.count;
        [self.tableView deleteRowsAtIndexPaths:selectRows withRowAnimation:UITableViewRowAnimationAutomatic];
        [self.tableView endUpdates];
        [self.tableView setEditing:NO animated:YES];
    }else{
        [self.navigationItem.rightBarButtonItem setTitle:@"完成"];
        [self.tableView setEditing:YES animated:YES];
    }
}

//添加一项
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Select---->:%ld",indexPath.row);
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"deselect---->:%ld",indexPath.row);
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
