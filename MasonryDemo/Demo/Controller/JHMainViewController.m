//
//  JHMainViewController.m
//  MasonryDemo
//
//  Created by qujiahong on 2018/7/23.
//  Copyright © 2018年 瞿嘉洪. All rights reserved.
//

#import "JHMainViewController.h"

#import "JHSampleVC.h"
#import "JHSampleNextVC.h"

#import "JHTest1VC.h"
#import "JHTest2VC.h"
#import "JHTest3VC.h"
#import "JHTest4VC.h"
#import "JHTest5VC.h"

@interface JHMainViewController ()<UITableViewDelegate,UITableViewDataSource>
/** table*/
@property (nonatomic, strong) UITableView * tabbleView;
/** dataList*/
@property (nonatomic, strong) NSMutableArray * dataList;
@end

@implementation JHMainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI{
    [self initWithCtrols];
}
- (void)initWithCtrols{
    _dataList = [[NSMutableArray alloc]initWithArray:@[
                                                       @"最呆板基操(瀑布流间隔)",
                                                       @"稍加提升(在视图中，加载排列子视图)--以下均为练习",
                                                       @"居中显示一个view",
                                                       @"基上添加一个padding为10的子view(三种方式)",
                                                       @"两等高、宽子视图，水平排列，间隔10",
                                                       @"1.左右20、上80下20，2.宽一半",
                                                       @"输入框上浮到键盘，不被遮挡"
                                                       ]];
    
    _tabbleView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    _tabbleView.delegate = self;
    _tabbleView.dataSource = self;
    [self.view addSubview:_tabbleView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * DemoCell = @"DemoCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DemoCell];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DemoCell];
    }
    cell.textLabel.text = self.dataList[indexPath.row];
    [cell.textLabel setFont:[UIFont systemFontOfSize:12.0]];
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            JHSampleVC * vc = [[JHSampleVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 1:
        {
            JHSampleNextVC * vc = [[JHSampleNextVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        
        case 2:
        {
            JHTest1VC * vc = [[JHTest1VC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:
        {
            JHTest2VC * vc = [[JHTest2VC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4:
        {
            JHTest3VC * vc = [[JHTest3VC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 5:
        {
            JHTest4VC * vc = [[JHTest4VC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 6:
        {
            JHTest5VC * vc = [[JHTest5VC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 7:
        {
            JHTest4VC * vc = [[JHTest4VC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}

@end
