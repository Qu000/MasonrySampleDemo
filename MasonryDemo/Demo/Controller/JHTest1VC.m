//
//  JHTest1VC.m
//  MasonryDemo
//
//  Created by qujiahong on 2018/7/23.
//  Copyright © 2018年 瞿嘉洪. All rights reserved.
//

#import "JHTest1VC.h"

@interface JHTest1VC ()

@end

@implementation JHTest1VC

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
}
@end
