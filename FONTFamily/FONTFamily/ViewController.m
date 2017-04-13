//
//  ViewController.m
//  FONTFamily
//
//  Created by apple on 13/4/17.
//  Copyright © 2017年 mark. All rights reserved.
//

#import "ViewController.h"

#define ScreenW  [UIScreen mainScreen].bounds.size.width
#define ScreenH  [UIScreen mainScreen].bounds.size.height

static NSString *cellid = @"cellindenify";

@interface ViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>
@property (nonatomic,strong) UITableView *tableview;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ViewController

#pragma mark - lazy

- (UITableView *)tableview{

    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,ScreenW, ScreenH) style:UITableViewStylePlain];
        _tableview.rowHeight = 100;
        _tableview.delegate = self;
        _tableview.dataSource = self;
    }
    
    return _tableview;
}

- (NSMutableArray *)dataArray{

    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (NSString *fontName in [UIFont familyNames]) {
        
        [self.dataArray addObject:fontName];
    }

    [self.view addSubview:self.tableview];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellid];
    }
    NSString *fontName = [self.dataArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = fontName;
    cell.detailTextLabel.font = [UIFont fontWithName:fontName size:20];
    cell.detailTextLabel.text = @"我是一段测试文字";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSString *fontName = [self.dataArray objectAtIndex:indexPath.row];
    [[[UIAlertView alloc] initWithTitle:@"选择的文字" message:fontName delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
    
    printf("%s\n",[[self.dataArray objectAtIndex:indexPath.row] UTF8String]);
}



@end
