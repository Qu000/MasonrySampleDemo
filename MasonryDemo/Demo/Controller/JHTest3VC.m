//
//  JHTest3VC.m
//  MasonryDemo
//
//  Created by qujiahong on 2018/7/23.
//  Copyright © 2018年 瞿嘉洪. All rights reserved.
//

#import "JHTest3VC.h"

@interface JHTest3VC ()

@end

@implementation JHTest3VC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self test1];
}

- (void)test1{
    WS(ws);
    
    UIView *view = [UIView new];
    view.backgroundColor = JHRandomColor;
    [self.view addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(@0);
        make.height.equalTo(@200);
        make.center.equalTo(ws.view);
    }];
    
    NSInteger padding = 10;
    UIView *view1 = [UIView new];
    view1.backgroundColor = JHRandomColor;
    [view addSubview:view1];
    
    UIView *view2 = [UIView new];
    view2.backgroundColor = JHRandomColor;
    [view addSubview:view2];
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(160);
        make.centerY.mas_equalTo(view.mas_centerY);
        make.width.equalTo(view2);
        make.left.equalTo(view).offset(padding);
        make.right.equalTo(view2.mas_left).offset(-padding);
    }];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(160);
        make.centerY.mas_equalTo(view.mas_centerY);
        make.width.equalTo(view2);
        make.left.equalTo(view1.mas_right).offset(padding);
        make.right.equalTo(view).offset(-padding);
    }];
    
}
@end
