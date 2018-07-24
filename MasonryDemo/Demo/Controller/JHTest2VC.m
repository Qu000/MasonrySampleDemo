//
//  JHTest2VC.m
//  MasonryDemo
//
//  Created by qujiahong on 2018/7/23.
//  Copyright © 2018年 瞿嘉洪. All rights reserved.
//

#import "JHTest2VC.h"

@interface JHTest2VC ()

@end

@implementation JHTest2VC

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
    
    UIView *view2 = [UIView new];
    view2.backgroundColor = JHRandomColor;
    [view addSubview:view2];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        //一：
        //make.top.left.equalTo(view).offset(10);
        //make.right.bottom.equalTo(view).offset(-10);
        
        //二：
        //make.edges.equalTo(view).insets(UIEdgeInsetsMake(10, 10, 10, 10));
        
        //三：
        make.top.left.bottom.right.equalTo(view).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
}



@end
