//
//  ViewController.m
//  TFRuntimeDemo
//
//  Created by 张永强 on 17/6/16.
//  Copyright © 2017年 TechFantasy. All rights reserved.
//

#import "ViewController.h"
#import "TFRuntimeManager.h"
#import "TFIvarAndMethodViewController.h"
#import "TFExchangeViewController.h"
#import "TFDictChangeModelViewController.h"
#import "TFArchiveViewController.h"

@interface ViewController ()<UITableViewDelegate , UITableViewDataSource>

/**列表数据 */
@property (nonatomic , strong)NSArray *dataList;



@end

@implementation ViewController


- (NSArray *)dataList {
    if (!_dataList) {
        _dataList = @[@"获取所有属性名" ,@"获得所有方法名",@"交换两个方法", @"取代某个方法",@"字典转模型",@"归档解档"];
    }
    return _dataList;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 60;
    [self.view addSubview:tableView];
    
}

#pragma mark --UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    NSString *str = self.dataList[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"runtime --- %@" , str];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:  case 1:
        {
            TFIvarAndMethodViewController *vc = [[TFIvarAndMethodViewController  alloc] init];
            vc.titleName = self.dataList[indexPath.row];
            vc.type = (int)indexPath.row + 1;
            [self.navigationController  pushViewController:vc animated:YES];
        }
            break;
        case 2:    case 3:
        {
            TFExchangeViewController *vc = [[TFExchangeViewController alloc] init];
            vc.titleName = self.dataList[indexPath.row];
            vc.type = (int)indexPath.row - 1;
            [self.navigationController  pushViewController:vc animated:YES];
        }
            break;
        case 4:
        {
            TFDictChangeModelViewController *vc = [[TFDictChangeModelViewController alloc] init];
            vc.titleName = self.dataList[indexPath.row];
            [self.navigationController  pushViewController:vc animated:YES];
        }   break;
        case 5:
        {
            TFArchiveViewController *vc = [[TFArchiveViewController alloc] init];
            vc.titleName = self.dataList[indexPath.row];
            [self.navigationController  pushViewController:vc animated:YES];
        }
            break;
            
        default:
            break;
    }
}


@end
