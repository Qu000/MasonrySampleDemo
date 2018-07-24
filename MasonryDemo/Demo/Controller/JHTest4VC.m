//
//  JHTest4VC.m
//  MasonryDemo
//
//  Created by qujiahong on 2018/7/23.
//  Copyright © 2018年 瞿嘉洪. All rights reserved.
//

#import "JHTest4VC.h"

@interface JHTest4VC ()

@end

@implementation JHTest4VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self test1];
}

- (void)test1{
    WS(ws);
    
    UIView *view = [UIView new];
    view.backgroundColor = JHRandomColor;
    [self.view addSubview:view];
  
    UIView *view2 = [UIView new];
    view2.backgroundColor = JHRandomColor;
    [self.view addSubview:view2];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@80);
        make.left.equalTo(@20);
        make.right.mas_equalTo(-20);
    }];

    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.mas_equalTo(-20);
        make.height.equalTo(view);
        make.top.equalTo(view.mas_bottom).offset(20);
        make.left.equalTo(ws.view.mas_centerX).offset(0);
    }];
}


@end
