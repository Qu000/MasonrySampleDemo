//
//  JHSampleVC.m
//  MasonryDemo
//
//  Created by qujiahong on 2018/7/23.
//  Copyright © 2018年 瞿嘉洪. All rights reserved.
//

#import "JHSampleVC.h"

@interface JHSampleVC ()
/** Top*/
@property (nonatomic, strong) UIView * topView;
/** Mid*/
@property (nonatomic, strong) UIView * midView;
/** Bottom*/
@property (nonatomic, strong) UIView * bottomView;
@end

@implementation JHSampleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI{
    
    self.topView = [self createView];
    self.midView = [self createView];
    self.bottomView = [self createView];
    
    [self setupFrameWithMasonry];
}

- (void)setupFrameWithMasonry{
    WS(ws);
    
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).offset(74);//距离顶部74
        make.left.equalTo(ws.view).offset(10);//距离左10
        make.right.equalTo(ws.view).offset(-10);//举例右10
        make.height.equalTo(@100);//高度
    }];
    
    [self.midView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.topView.mas_bottom).offset(30);//距离topView30
        make.left.equalTo(ws.view).offset(20);
        make.right.equalTo(ws.view).offset(-20);
        make.height.equalTo(@100);
    }];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.midView.mas_bottom).offset(10);
        make.width.height.mas_equalTo(ws.midView);//宽、高与midView一致
        make.centerX.equalTo(ws.view);//centerX与父视图一致
    }];
}

- (UIView *)createView{
    
    UIView *View = [[UIView alloc]init];
    View.backgroundColor = JHRandomColor;
    [self.view addSubview:View];
    return View;
}


@end
